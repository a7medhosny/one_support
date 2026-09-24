import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_button.dart';

/// Clean state shown when no tickets match filters or no tickets exist.
class TicketEmptyState extends StatelessWidget {
  final VoidCallback? onCreateTicket;
  final String? message;
  final String? description;

  const TicketEmptyState({
    super.key,
    this.onCreateTicket,
    this.message,
    this.description,
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
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.confirmation_number_outlined,
                size: 48,
                color: colorScheme.primary,
              ),
            ),
            verticalSpace(20),
            Text(
              message ?? context.l10n.noTicketsFound,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(8),
            Text(
              description ?? context.l10n.noTicketsDescription,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (onCreateTicket != null) ...[
              verticalSpace(24),
              AppButton(
                text: context.l10n.newTicket,
                icon: const Icon(Icons.add_rounded, size: 20),
                width: 180,
                height: 44,
                onPressed: onCreateTicket,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
