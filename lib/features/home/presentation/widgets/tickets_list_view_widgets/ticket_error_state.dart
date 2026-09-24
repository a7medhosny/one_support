import 'package:flutter/material.dart';

import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_button.dart';

/// Error state shown when ticket loading fails with a retry action.
class TicketErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const TicketErrorState({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.errorContainer.withValues(alpha: 0.4),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.cloud_off_rounded,
                size: 40,
                color: colorScheme.error,
              ),
            ),
            verticalSpace(16),
            Text(
              context.l10n.errorOccurred,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              errorMessage,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(24),
            AppButton(
              text: context.l10n.retry,
              icon: const Icon(Icons.refresh_rounded, size: 20),
              width: 160,
              height: 44,
              backgroundColor: colorScheme.primary,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}
