import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../data/models/ticket_response_model.dart';

/// Summary metric cards showing counts of tickets grouped by status.
class TicketStatsOverview extends StatelessWidget {
  final List<TicketResponseModel> tickets;
  final int? totalCount;

  const TicketStatsOverview({
    super.key,
    required this.tickets,
    this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final total = totalCount ?? tickets.length;
    final openCount = tickets
        .where((t) => t.status.toLowerCase().replaceAll(' ', '') == 'open')
        .length;
    final inProgressCount = tickets
        .where(
          (t) => t.status.toLowerCase().replaceAll(' ', '') == 'inprogress',
        )
        .length;
    final resolvedCount = tickets
        .where((t) => t.status.toLowerCase().replaceAll(' ', '') == 'resolved')
        .length;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _StatCard(
            title: context.l10n.totalTickets,
            count: total,
            icon: Icons.all_inbox_rounded,
            color: context.colorScheme.primary,
            containerColor: context.colorScheme.primaryContainer.withValues(
              alpha: 0.5,
            ),
          ),
          horizontalSpace(10),
          _StatCard(
            title: context.l10n.statusOpen,
            count: openCount,
            icon: Icons.radio_button_checked_rounded,
            color: const Color(0xFF1976D2),
            containerColor: const Color(0xFFE3F2FD),
          ),
          horizontalSpace(10),
          _StatCard(
            title: context.l10n.statusInProgress,
            count: inProgressCount,
            icon: Icons.timelapse_rounded,
            color: const Color(0xFFF57C00),
            containerColor: const Color(0xFFFFF3E0),
          ),
          horizontalSpace(10),
          _StatCard(
            title: context.l10n.statusResolved,
            count: resolvedCount,
            icon: Icons.check_circle_outline_rounded,
            color: const Color(0xFF388E3C),
            containerColor: const Color(0xFFE8F5E9),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;
  final Color containerColor;

  const _StatCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
            : containerColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: context.isDarkMode ? 0.3 : 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$count',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: context.isDarkMode
                      ? context.colorScheme.onSurface
                      : color,
                ),
              ),
              Icon(icon, size: 20, color: color),
            ],
          ),
          verticalSpace(4),
          Text(
            title,
            style: textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
