import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../data/models/ticket_response_model.dart';
import '../ticket_detailes_widgets/ticket_details_bottom_sheet.dart';
import '../ticket_detailes_widgets/ticket_priority_badge.dart';
import '../ticket_detailes_widgets/ticket_status_badge.dart';

/// Interactive card component representing a single support ticket.
class TicketCard extends StatelessWidget {
  final TicketResponseModel ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final formattedDate = DateFormat(
      'MMM d, yyyy • h:mm a',
    ).format(ticket.createdAt.toLocal());

    return InkWell(
      onTap: () => TicketDetailsBottomSheet.show(context, ticket),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: Badges
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TicketStatusBadge(status: ticket.status),
                TicketPriorityBadge(priority: ticket.priority),
              ],
            ),
            verticalSpace(12),
            // Title
            Text(
              ticket.title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(6),
            // Description snippet
            Text(
              ticket.description,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            verticalSpace(14),
            const Divider(height: 1),
            verticalSpace(10),
            // Bottom Row: Assigned agent & Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 15,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    horizontalSpace(4),
                    Text(
                      ticket.assignedAgentName ?? context.l10n.unassigned,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    horizontalSpace(4),
                    Text(
                      formattedDate,
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
