import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/btc/domain/currency_enum.dart';
import 'package:sample_btc_tracker/features/converter/presentation/widgets/base_text_form_field.dart';

class CurrencyTextFormField extends StatelessWidget {
  final TextEditingController currencyTextController;
  final void Function(String) onTextChanged;
  final void Function(Currency) onCurrencyChanged;
  final Currency selectedCurrency;
  final bool readOnly;
  final Key popupMenuKey;
  const CurrencyTextFormField({
    required this.currencyTextController,
    required this.onTextChanged,
    required this.onCurrencyChanged,
    required this.selectedCurrency,
    required this.readOnly,
    required this.popupMenuKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      key: key,
      readOnly: readOnly,
      textController: currencyTextController,
      onChanged: onTextChanged,
      symbol: selectedCurrency.symbol,
      suffix: PopupMenuButton<Currency>(
        popUpAnimationStyle: AnimationStyle.noAnimation,
        key: popupMenuKey,
        itemBuilder: (context) => Currency.values
            .map(
              (element) => PopupMenuItem(
                value: element,
                child: Text(
                  element.name.toUpperCase(),
                  style: context.textTheme.bodySmall,
                ),
              ),
            )
            .toList(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onSelected: onCurrencyChanged,
        color: context.themeData.scaffoldBackgroundColor,
        child: SizedBox(
          width: 40,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              Text(
                selectedCurrency.name.toUpperCase(),
                style: context.textTheme.bodySmall,
              ),
              Icon(
                Icons.arrow_drop_down,
                size: 10,
                color: context.themeData.colorScheme.onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
