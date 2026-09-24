import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';

/// Reusable badge widget to display ticket status with consistent styling.
class TicketStatusBadge extends StatelessWidget {
  final String status;

  const TicketStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusConfig = _getStatusConfig(context, status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: statusConfig.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusConfig.borderColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(statusConfig.icon, size: 13, color: statusConfig.textColor),
          const SizedBox(width: 4),
          Text(
            statusConfig.label,
            style: context.textTheme.labelSmall?.copyWith(
              color: statusConfig.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _StatusConfig _getStatusConfig(BuildContext context, String rawStatus) {
    final normalized = rawStatus
        .toLowerCase()
        .replaceAll(' ', '')
        .replaceAll('_', '');

    switch (normalized) {
      case 'open':
        return _StatusConfig(
          label: context.l10n.statusOpen,
          backgroundColor: const Color(0xFFE3F2FD),
          textColor: const Color(0xFF1565C0),
          borderColor: const Color(0xFF90CAF9),
          icon: Icons.radio_button_checked_rounded,
        );
      case 'inprogress':
        return _StatusConfig(
          label: context.l10n.statusInProgress,
          backgroundColor: const Color(0xFFFFF3E0),
          textColor: const Color(0xFFE65100),
          borderColor: const Color(0xFFFFCC80),
          icon: Icons.timelapse_rounded,
        );
      case 'resolved':
        return _StatusConfig(
          label: context.l10n.statusResolved,
          backgroundColor: const Color(0xFFE8F5E9),
          textColor: const Color(0xFF2E7D32),
          borderColor: const Color(0xFFA5D6A7),
          icon: Icons.check_circle_outline_rounded,
        );
      case 'closed':
        return _StatusConfig(
          label: context.l10n.statusClosed,
          backgroundColor: const Color(0xFFECEFF1),
          textColor: const Color(0xFF455A64),
          borderColor: const Color(0xFFCFD8DC),
          icon: Icons.lock_outline_rounded,
        );
      default:
        return _StatusConfig(
          label: rawStatus,
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          textColor: context.colorScheme.onSurfaceVariant,
          borderColor: context.colorScheme.outlineVariant,
          icon: Icons.info_outline_rounded,
        );
    }
  }
}

class _StatusConfig {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final IconData icon;

  const _StatusConfig({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.icon,
  });
}
