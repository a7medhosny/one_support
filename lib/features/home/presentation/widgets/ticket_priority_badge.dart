import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';

/// Reusable badge widget to display ticket priority level.
class TicketPriorityBadge extends StatelessWidget {
  final String priority;

  const TicketPriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final priorityConfig = _getPriorityConfig(context, priority);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: priorityConfig.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(priorityConfig.icon, size: 13, color: priorityConfig.textColor),
          const SizedBox(width: 4),
          Text(
            priorityConfig.label,
            style: context.textTheme.labelSmall?.copyWith(
              color: priorityConfig.textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  _PriorityConfig _getPriorityConfig(BuildContext context, String rawPriority) {
    final normalized = rawPriority.toLowerCase().trim();

    switch (normalized) {
      case 'low':
        return _PriorityConfig(
          label: context.l10n.priorityLow,
          backgroundColor: const Color(0xFFE8F5E9),
          textColor: const Color(0xFF2E7D32),
          icon: Icons.arrow_downward_rounded,
        );
      case 'medium':
        return _PriorityConfig(
          label: context.l10n.priorityMedium,
          backgroundColor: const Color(0xFFFFF8E1),
          textColor: const Color(0xFFF57F17),
          icon: Icons.remove_rounded,
        );
      case 'high':
        return _PriorityConfig(
          label: context.l10n.priorityHigh,
          backgroundColor: const Color(0xFFFFEBEE),
          textColor: const Color(0xFFC62828),
          icon: Icons.arrow_upward_rounded,
        );
      case 'critical':
        return _PriorityConfig(
          label: context.l10n.priorityCritical,
          backgroundColor: const Color(0xFFFFCDD2),
          textColor: const Color(0xFFB71C1C),
          icon: Icons.priority_high_rounded,
        );
      default:
        return _PriorityConfig(
          label: rawPriority,
          backgroundColor: context.colorScheme.surfaceContainerHighest,
          textColor: context.colorScheme.onSurfaceVariant,
          icon: Icons.flag_outlined,
        );
    }
  }
}

class _PriorityConfig {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const _PriorityConfig({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
  });
}
