import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/core.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final void Function(String) onChanged;
  final bool readOnly;
  final String symbol;
  final Widget suffix;

  const BaseTextFormField({
    required this.onChanged,
    required this.readOnly,
    required this.symbol,
    required this.suffix,
    required this.textController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      readOnly: readOnly,
      onTapOutside: (pointer) => FocusScope.of(context).unfocus(),
      controller: textController,
      onChanged: (value) {
        if (value.trim().isNotEmpty) {
          final rawInput = value.replaceAll(',', '');
          onChanged(rawInput);
        } else {
          onChanged('0');
        }
      },
      style: context.textTheme.bodyLarge,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.done,
      inputFormatters: [ThousandsSeparatorInputFormatter()],
      decoration: InputDecoration(
        prefix: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(symbol, style: context.textTheme.bodyLarge),
        ),
        suffix: suffix,
      ),
    );
  }
}
