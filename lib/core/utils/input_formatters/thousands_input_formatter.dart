import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove commas
    final String rawText = newValue.text.replaceAll(',', '');

    // If user just typed ".", allow "0."
    if (rawText == '.') {
      return const TextEditingValue(
        text: '0.',
        selection: TextSelection.collapsed(offset: 2),
      );
    }

    // If ends with ".", keep it as is (e.g. "123.")
    if (rawText.endsWith('.')) {
      final numberPart = rawText.substring(0, rawText.length - 1);
      final formatted = _formatter.format(int.tryParse(numberPart) ?? 0);
      return TextEditingValue(
        text: '$formatted.',
        selection: TextSelection.collapsed(offset: formatted.length + 1),
      );
    }

    // Normal decimal case
    final double? value = double.tryParse(rawText);
    if (value == null) {
      return oldValue;
    }

    // Split integer and decimal parts
    final List<String> parts = rawText.split('.');
    final String intPart = parts[0];
    final String? decimalPart = parts.length > 1 ? parts[1] : null;

    final String formattedInt = _formatter.format(int.tryParse(intPart) ?? 0);
    final String newText = decimalPart != null
        ? '$formattedInt.$decimalPart'
        : formattedInt;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
