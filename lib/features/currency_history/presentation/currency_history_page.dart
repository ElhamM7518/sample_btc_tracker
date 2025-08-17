import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/bloc/btc_bloc.dart';
import 'package:sample_btc_tracker/features/btc/domain/currency_enum.dart';

class CurrencyHistoryPage extends StatelessWidget {
  final Currency currency;

  const CurrencyHistoryPage({required this.currency, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.resolve<BtcBloc>(),
      child: CurrencyHistoryView(currency: currency),
    );
  }
}

class CurrencyHistoryView extends StatefulWidget {
  final Currency currency;

  const CurrencyHistoryView({required this.currency, super.key});

  @override
  State<CurrencyHistoryView> createState() => _CurrencyHistoryViewState();
}

class _CurrencyHistoryViewState extends State<CurrencyHistoryView> {
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
      appBar: CustomAppbar(
        title: '${context.l10n.btc} / ${widget.currency.name.toUpperCase()}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            BlocBuilder<BtcBloc, BtcState>(
              buildWhen: (previous, current) => switch ((previous, current)) {
                (
                  BtcLoadSuccess(currencyPrices: final preCurrencyPrices),
                  BtcLoadSuccess(:final currencyPrices),
                ) =>
                  preCurrencyPrices != currencyPrices,
                (BtcLoading(), BtcLoadSuccess()) => true,
                (_, _) => false,
              },
              builder: (context, state) {
                switch (state) {
                  case BtcInitial():
                  case BtcLoading():
                  case BtcLoadFailure():
                    return const SizedBox();
                  case BtcLoadSuccess(:final currencyPrices):
                    return Text(
                      '${widget.currency.symbol} ${NumberFormat("#,##0.000000").format(currencyPrices.firstWhere((element) => element.currency == widget.currency).price)}',
                      style: context.textTheme.displayLarge,
                    );
                }
              },
            ),
            BlocBuilder<BtcBloc, BtcState>(
              buildWhen: (previous, current) => switch ((previous, current)) {
                (
                  BtcLoadSuccess(
                    currencyPricesHistory: final preCurrencyPricesHistory,
                  ),
                  BtcLoadSuccess(:final currencyPricesHistory),
                ) =>
                  preCurrencyPricesHistory[widget.currency]!.length !=
                      currencyPricesHistory[widget.currency]!.length,
                (BtcLoading(), BtcLoadFailure() || BtcLoadSuccess()) => true,
                (_, _) => false,
              },
              builder: (context, state) {
                switch (state) {
                  case BtcInitial():
                  case BtcLoading():
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 24,
                      children: [
                        ShimmerBox(
                          width: context.width - 24,
                          height: 24,
                          radius: 2,
                        ),
                        ShimmerBox(
                          width: context.width - 24,
                          height: 300,
                          radius: 2,
                        ),
                      ],
                    );
                  case BtcLoadFailure(:final failure):
                    return RetryFailure(error: failure, onRetry: _loadData);
                  case BtcLoadSuccess(:final currencyPricesHistory):
                    final spots = currencyPricesHistory[widget.currency]!
                        .asMap()
                        .entries
                        .map(
                          (element) => FlSpot(
                            element.key.toDouble(),
                            element.value.price,
                          ),
                        )
                        .toList();

                    final minPrice = spots
                        .map((s) => s.y)
                        .reduce((a, b) => a < b ? a : b);
                    final maxPrice = spots
                        .map((s) => s.y)
                        .reduce((a, b) => a > b ? a : b);

                    // To showing the chart more user-friendly
                    final adjustedMinY = minPrice - (maxPrice - minPrice) * 0.3;
                    final adjustedMaxY = maxPrice + (maxPrice - minPrice) * 0.3;

                    return Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          height: 300,
                          child: LineChart(
                            LineChartData(
                              minY: adjustedMinY,
                              maxY: adjustedMaxY,
                              borderData: FlBorderData(
                                border: Border(
                                  right: BorderSide(
                                    color: context.themeData.dividerColor,
                                  ),
                                  bottom: BorderSide(
                                    color: context.themeData.dividerColor,
                                  ),
                                  top: BorderSide(
                                    color: context.themeData.dividerColor,
                                    width: 0.2,
                                  ),
                                  left: BorderSide(
                                    color: context.themeData.dividerColor,
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: spots,
                                  color: context.themeData.primaryColor,
                                  dotData: const FlDotData(show: false),
                                  aboveBarData: BarAreaData(
                                    color: context
                                        .themeData
                                        .scaffoldBackgroundColor,
                                  ),
                                  belowBarData: BarAreaData(
                                    color: context
                                        .themeData
                                        .scaffoldBackgroundColor,
                                  ),
                                ),
                              ],
                              titlesData: FlTitlesData(
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      final index = value.toInt();
                                      final time =
                                          currencyPricesHistory[widget
                                                  .currency]![index]
                                              .timeStamp;
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                                          style: context.textTheme.labelSmall!
                                              .copyWith(fontSize: 8),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                leftTitles: const AxisTitles(),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    reservedSize: 60,
                                    showTitles: true,
                                    maxIncluded: maxPrice == minPrice,
                                    minIncluded: maxPrice == minPrice,
                                    getTitlesWidget: (value, meta) {
                                      return Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: Text(
                                          NumberFormat('#,##0').format(value),
                                          style: context.textTheme.bodySmall,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                topTitles: const AxisTitles(),
                              ),
                              lineTouchData: LineTouchData(
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipPadding: const EdgeInsets.all(2),
                                  tooltipBorderRadius: BorderRadius.circular(8),
                                  getTooltipColor: (spot) =>
                                      context.colorScheme.surface,
                                  getTooltipItems:
                                      (List<LineBarSpot> touchedSpots) {
                                        return touchedSpots.map((
                                          LineBarSpot touchedSpot,
                                        ) {
                                          return LineTooltipItem(
                                            NumberFormat(
                                              '#,##0.0',
                                            ).format(touchedSpot.y),
                                            context.textTheme.bodySmall!,
                                          );
                                        }).toList();
                                      },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
