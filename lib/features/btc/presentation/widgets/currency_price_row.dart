import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/domain/entities/currency_price_entity.dart';

class CurrencyPriceRow extends StatelessWidget {
  final CurrencyPriceEntity currencyPrice;
  const CurrencyPriceRow({required this.currencyPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => CurrencyHistoryRouteData(currencyPrice.currency).go(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: context.l10n.btc,
                style: context.textTheme.displayMedium,
                children: [
                  TextSpan(
                    text: ' / ${currencyPrice.currency.name.toUpperCase()}',
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Row(
              spacing: 8,
              children: [
                Text(
                  '${currencyPrice.currency.symbol} ${NumberFormat("#,##0.000000").format(currencyPrice.price)}',
                  style: context.textTheme.displayMedium,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: context.themeData.dividerColor,
                  size: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
