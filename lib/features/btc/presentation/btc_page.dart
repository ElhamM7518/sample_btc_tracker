import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/bloc/btc_bloc.dart';
import 'package:sample_btc_tracker/features/btc/presentation/widgets/widgets.dart';
import 'package:sample_btc_tracker/features/converter/bloc/converter_bloc.dart';

class BtcPage extends StatelessWidget {
  const BtcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ServiceLocator.resolve<BtcBloc>()),
        BlocProvider.value(value: ServiceLocator.resolve<ConverterBloc>()),
      ],
      child: const BtcView(),
    );
  }
}

class BtcView extends StatefulWidget {
  const BtcView({super.key});

  @override
  State<BtcView> createState() => _BtcViewState();
}

class _BtcViewState extends State<BtcView> {
  late final BtcBloc _btcBloc;

  @override
  void initState() {
    super.initState();
    _btcBloc = context.read<BtcBloc>();
    _loadData();
  }

  void _loadData() {
    switch (_btcBloc.state) {
      case BtcInitial():
      case BtcLoadFailure():
        _btcBloc.add(const BtcEvent.loaded());
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          spacing: 2,
          children: [
            Text(context.l10n.bitcoin, style: context.textTheme.displayLarge),
            BlocBuilder<BtcBloc, BtcState>(
              buildWhen: (previous, current) => switch ((previous, current)) {
                (BtcLoading(), BtcLoadSuccess() || BtcLoadFailure()) => true,
                (
                  BtcLoadSuccess(timeStamp: final preTimeStamp),
                  BtcLoadSuccess(:final timeStamp),
                ) =>
                  preTimeStamp != timeStamp,
                (_, _) => false,
              },
              builder: (context, state) {
                switch (state) {
                  case BtcInitial():
                  case BtcLoading():
                    return ShimmerBox(
                      width: context.width - 24,
                      height: 24,
                      radius: 2,
                    );
                  case BtcLoadFailure():
                    return const SizedBox();
                  case BtcLoadSuccess(:final timeStamp):
                    return Text(
                      '${context.l10n.latestUpdate}: ${DateFormat("MMM d, yyyy HH:mm:ss 'UTC'").format(timeStamp)}',
                      style: context.textTheme.labelSmall,
                    );
                }
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocListener<BtcBloc, BtcState>(
        listenWhen: (previous, current) => switch ((previous, current)) {
          (_, BtcLoadSuccess()) => true,
          (_, _) => false,
        },
        listener: (context, state) {
          switch (state) {
            case BtcLoadSuccess(:final currencyPrices):
              if (EnvironmentVariables.environment != Environment.test) {
                final converterBloc = context.read<ConverterBloc>();
                converterBloc.add(
                  ConverterEvent.currencyPriceUpdated(
                    currencyPrices.firstWhere(
                      (element) =>
                          element.currency ==
                          converterBloc.state.selectedCurrency,
                    ),
                  ),
                );
              }
            default:
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<BtcBloc, BtcState>(
            listenWhen: (previous, current) => switch ((previous, current)) {
              (
                BtcLoadSuccess(:final isRefreshing),
                BtcLoadSuccess(:final failedToRefresh),
              ) =>
                isRefreshing && failedToRefresh != null,
              (_, _) => false,
            },
            listener: (context, state) {
              switch (state) {
                case BtcLoadSuccess(:final failedToRefresh):
                  if (failedToRefresh != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.colorScheme.errorContainer,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        content: Text(
                          failedToRefresh.fold(
                            networkFailure: () => context.l10n.networkError,
                            unknownServerFailure: () =>
                                context.l10n.unknownError,
                            serverFailure: (code, message) =>
                                '${context.l10n.serverError} $message',
                          ),
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.themeData.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    );
                  }
                default:
              }
            },
            builder: (context, state) {
              switch (state) {
                case BtcInitial():
                case BtcLoading():
                  return ListView.separated(
                    itemBuilder: (context, index) =>
                        const ShimmerBox(width: double.infinity, height: 40),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 3,
                  );
                case BtcLoadFailure(:final failure):
                  return RetryFailure(error: failure, onRetry: _loadData);
                case BtcLoadSuccess(:final currencyPrices):
                  return ListView.separated(
                    itemBuilder: (context, index) =>
                        CurrencyPriceRow(currencyPrice: currencyPrices[index]),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: currencyPrices.length,
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
