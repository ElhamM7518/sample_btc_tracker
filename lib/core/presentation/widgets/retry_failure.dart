import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/core.dart';

class RetryFailure extends StatelessWidget {
  final CommonFailure error;
  final void Function() onRetry;
  const RetryFailure({required this.error, required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          error.fold(
            networkFailure: () => context.l10n.networkError,
            unknownServerFailure: () => context.l10n.unknownError,
            serverFailure: (code, message) =>
                '${context.l10n.serverError} $message',
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: onRetry,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.refresh, color: Colors.red, size: 20),
                const SizedBox(width: 8),
                Text(
                  context.l10n.tryAgainButtonTitle,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
