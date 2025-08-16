import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/bloc/btc_bloc.dart';
import 'package:sample_btc_tracker/features/converter/bloc/converter_bloc.dart';
import 'package:sample_btc_tracker/features/converter/presentation/widgets/widgets.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ServiceLocator.resolve<BtcBloc>()),
        BlocProvider.value(value: ServiceLocator.resolve<ConverterBloc>()),
      ],
      child: const ConverterView(),
    );
  }
}

class ConverterView extends StatefulWidget {
  const ConverterView({super.key});

  @override
  State<ConverterView> createState() => _ConverterViewState();
}

class _ConverterViewState extends State<ConverterView> {
  late final ConverterBloc _converterBloc;
  late final BtcBloc _btcBloc;
  final _currencyTextController = TextEditingController();
  final _btcTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _btcBloc = context.read<BtcBloc>();
    _loadData();
    _converterBloc = context.read<ConverterBloc>();
    _updateCurrencyController(_converterBloc.state.currencyAmount);
    _updateBtcController(_converterBloc.state.btcAmount);
  }

  void _loadData() {
    switch (_btcBloc.state) {
      case BtcInitial():
      case BtcLoadFailure():
        _btcBloc.add(const BtcEvent.loaded());
      default:
    }
  }

  void _updateCurrencyController(double amount) {
    _currencyTextController.text = NumberFormat('#,##0.######').format(amount);
  }

  void _updateBtcController(double amount) {
    _btcTextController.text = NumberFormat('#,##0.######').format(amount);
  }

  @override
  void dispose() {
    _currencyTextController.dispose();
    _btcTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: context.l10n.converter),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: BlocConsumer<BtcBloc, BtcState>(
          listenWhen: (previous, current) => switch ((previous, current)) {
            (_, BtcLoadSuccess()) => true,
            (_, _) => false,
          },
          listener: (context, state) {
            switch (state) {
              case BtcLoadSuccess(:final currencyPrices):
                _converterBloc.add(
                  ConverterEvent.currencyPriceUpdated(
                    currencyPrices.firstWhere(
                      (element) =>
                          element.currency ==
                          _converterBloc.state.selectedCurrency,
                    ),
                  ),
                );
              default:
            }
          },
          builder: (context, state) {
            switch (state) {
              case BtcInitial():
              case BtcLoading():
                return const Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    ShimmerBox(width: double.infinity, height: 30, radius: 8),
                    ShimmerBox(width: 25, height: 25, shape: BoxShape.circle),
                    ShimmerBox(width: double.infinity, height: 30, radius: 8),
                  ],
                );
              case BtcLoadFailure(:final failure):
                return RetryFailure(error: failure, onRetry: _loadData);
              case BtcLoadSuccess(:final currencyPrices):
                return BlocBuilder<ConverterBloc, ConverterState>(
                  builder: (context, state) {
                    if (state.currencyToBtc) {
                      _updateBtcController(state.btcAmount);
                    } else {
                      _updateCurrencyController(state.currencyAmount);
                    }
                    final currencyField = CurrencyTextFormField(
                      readOnly: !state.currencyToBtc,
                      selectedCurrency: state.selectedCurrency,
                      currencyTextController: _currencyTextController,
                      onTextChanged: (value) => _converterBloc.add(
                        ConverterEvent.currencyAmountChanged(
                          amount: double.parse(value),
                          currentPrice: currencyPrices.firstWhere(
                            (element) =>
                                element.currency == state.selectedCurrency,
                          ),
                        ),
                      ),
                      onCurrencyChanged: (currency) => _converterBloc.add(
                        ConverterEvent.currencyChanged(
                          currency: currency,
                          currentPrice: currencyPrices.firstWhere(
                            (element) => element.currency == currency,
                          ),
                        ),
                      ),
                    );
                    final btcField = BtcTextFormField(
                      readOnly: state.currencyToBtc,
                      btcTextController: _btcTextController,
                      onChanged: (value) => _converterBloc.add(
                        ConverterEvent.btcAmountChanged(
                          amount: double.parse(value),
                          currentPrice: currencyPrices.firstWhere(
                            (element) =>
                                element.currency == state.selectedCurrency,
                          ),
                        ),
                      ),
                    );
                    return Column(
                      spacing: 16,
                      children: [
                        TextFieldAnimatedSwitcher(
                          begin: const Offset(0, -0.3),
                          child: state.currencyToBtc ? currencyField : btcField,
                        ),
                        IconButton(
                          onPressed: () => _converterBloc.add(
                            const ConverterEvent.converterDirectionChanged(),
                          ),
                          icon: Icon(
                            Icons.currency_exchange_rounded,
                            size: 25,
                            color: context.themeData.primaryColor,
                          ),
                        ),
                        TextFieldAnimatedSwitcher(
                          begin: const Offset(0, 0.3),
                          child: state.currencyToBtc ? btcField : currencyField,
                        ),
                      ],
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
