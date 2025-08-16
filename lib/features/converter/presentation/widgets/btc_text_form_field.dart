import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/core.dart';
import 'package:sample_btc_tracker/features/converter/presentation/widgets/base_text_form_field.dart';

class BtcTextFormField extends StatelessWidget {
  final TextEditingController btcTextController;
  final void Function(String) onChanged;
  final bool readOnly;
  const BtcTextFormField({
    required this.btcTextController,
    required this.onChanged,
    required this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      readOnly: readOnly,
      symbol: '₿',
      onChanged: onChanged,
      textController: btcTextController,
      suffix: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(context.l10n.btc, style: context.textTheme.bodySmall),
      ),
    );
  }
}
