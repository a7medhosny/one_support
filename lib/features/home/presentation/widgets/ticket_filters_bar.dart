import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';

/// Interactive filter chips for status and priority.
class TicketFiltersBar extends StatelessWidget {
  final String? selectedStatus;
  final String? selectedPriority;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<String?> onPriorityChanged;

  const TicketFiltersBar({
    super.key,
    required this.selectedStatus,
    required this.selectedPriority,
    required this.onStatusChanged,
    required this.onPriorityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final statusList = [
      (null, context.l10n.statusAll),
      ('Open', context.l10n.statusOpen),
      ('InProgress', context.l10n.statusInProgress),
      ('Resolved', context.l10n.statusResolved),
      ('Closed', context.l10n.statusClosed),
    ];

    final priorityList = [
      (null, context.l10n.statusAll),
      ('Low', context.l10n.priorityLow),
      ('Medium', context.l10n.priorityMedium),
      ('High', context.l10n.priorityHigh),
      ('Critical', context.l10n.priorityCritical),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status Filters
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: statusList.map((item) {
              final isSelected = selectedStatus == item.$1;
              return Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: FilterChip(
                  label: Text(item.$2),
                  selected: isSelected,
                  showCheckmark: false,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.onSurface,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 13,
                  ),
                  selectedColor: context.colorScheme.primary,
                  backgroundColor: context.isDarkMode
                      ? context.colorScheme.surfaceContainerHighest
                      : context.colorScheme.surfaceContainerHighest.withValues(
                          alpha: 0.3,
                        ),
                  side: BorderSide(
                    color: isSelected
                        ? context.colorScheme.primary
                        : context.colorScheme.outlineVariant.withValues(
                            alpha: 0.5,
                          ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSelected: (_) => onStatusChanged(item.$1),
                ),
              );
            }).toList(),
          ),
        ),
        verticalSpace(6),
        // Priority Filters
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                '${context.l10n.priority}:',
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              horizontalSpace(8),
              ...priorityList.map((item) {
                final isSelected = selectedPriority == item.$1;
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 6),
                  child: ChoiceChip(
                    label: Text(item.$2),
                    selected: isSelected,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? context.colorScheme.onSecondary
                          : context.colorScheme.onSurfaceVariant,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      fontSize: 12,
                    ),
                    selectedColor: context.colorScheme.secondary,
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: isSelected
                          ? context.colorScheme.secondary
                          : context.colorScheme.outlineVariant.withValues(
                              alpha: 0.4,
                            ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onSelected: (_) => onPriorityChanged(item.$1),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
