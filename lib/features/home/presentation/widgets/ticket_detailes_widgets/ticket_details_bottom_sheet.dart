import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../data/models/ticket_activity_response_model.dart';
import '../../../data/models/ticket_comment_response_model.dart';
import '../../../data/models/ticket_response_model.dart';
import '../../../data/models/update_ticket_status_request_model.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';
import 'ticket_activity_timeline_section.dart';
import 'ticket_comments_section.dart';
import 'ticket_priority_badge.dart';
import 'ticket_status_badge.dart';

/// Modal bottom sheet displaying complete details, comments, and activity trail of a ticket.
class TicketDetailsBottomSheet extends StatefulWidget {
  final TicketResponseModel ticket;

  const TicketDetailsBottomSheet({super.key, required this.ticket});

  static Future<void> show(BuildContext context, TicketResponseModel ticket) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<HomeCubit>(),
          child: TicketDetailsBottomSheet(ticket: ticket),
        );
      },
    );
  }

  @override
  State<TicketDetailsBottomSheet> createState() =>
      _TicketDetailsBottomSheetState();
}

class _TicketDetailsBottomSheetState extends State<TicketDetailsBottomSheet>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  List<TicketCommentResponseModel>? _comments;
  List<TicketActivityResponseModel>? _activities;
  bool _isLoadingComments = false;
  bool _isLoadingActivities = false;
  bool _isUpdatingStatus = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchDetails();
  }

  void _fetchDetails() {
    final cubit = context.read<HomeCubit>();
    _isLoadingComments = true;
    _isLoadingActivities = true;
    cubit.getTicketComments(widget.ticket.id);
    cubit.getTicketActivities(widget.ticket.id);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onToggleStatus() {
    final isClosed =
        widget.ticket.status.toLowerCase().replaceAll(' ', '') == 'closed';
    final newStatus = isClosed ? 'Open' : 'Closed';

    setState(() {
      _isUpdatingStatus = true;
    });

    context.read<HomeCubit>().updateTicketStatus(
      widget.ticket.id,
      UpdateTicketStatusRequestModel(status: newStatus),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final isClosed =
        widget.ticket.status.toLowerCase().replaceAll(' ', '') == 'closed';
    final formattedCreatedAt = DateFormat(
      'MMM d, yyyy • h:mm a',
    ).format(widget.ticket.createdAt.toLocal());

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          getTicketCommentsSuccess: (comments) {
            setState(() {
              _comments = comments;
              _isLoadingComments = false;
            });
          },
          getTicketCommentsLoading: () {
            setState(() {
              _isLoadingComments = true;
            });
          },

          getTicketCommentsFailure: (_) {
            setState(() {
              _isLoadingComments = false;
            });
          },
          getTicketActivitiesSuccess: (activities) {
            setState(() {
              _activities = activities;
              _isLoadingActivities = false;
            });
          },

          getTicketActivitiesLoading: () {
            setState(() {
              _isLoadingActivities = true;
            });
          },

          getTicketActivitiesFailure: (_) {
            setState(() {
              _isLoadingActivities = false;
            });
          },
          updateTicketStatusSuccess: (_) {
            setState(() {
              _isUpdatingStatus = false;
            });
            Navigator.of(context).pop();
          },
          updateTicketStatusFailure: (_) {
            setState(() {
              _isUpdatingStatus = false;
            });
          },
        );
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.ticketDetails,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // Content
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    children: [
                      // Title & Badges
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.ticket.title,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: [
                          TicketStatusBadge(status: widget.ticket.status),
                          TicketPriorityBadge(priority: widget.ticket.priority),
                        ],
                      ),
                      verticalSpace(16),
                      // Description
                      Text(
                        context.l10n.ticketDescription,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      verticalSpace(6),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: context.isDarkMode
                              ? colorScheme.surfaceContainerHighest.withValues(
                                  alpha: 0.3,
                                )
                              : colorScheme.surfaceContainerHighest.withValues(
                                  alpha: 0.2,
                                ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorScheme.outlineVariant.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        child: Text(
                          widget.ticket.description,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface,
                            height: 1.4,
                          ),
                        ),
                      ),
                      verticalSpace(16),
                      // Metadata Info
                      _buildMetaRow(
                        context,
                        icon: Icons.person_outline_rounded,
                        label: context.l10n.assignedTo,
                        value:
                            widget.ticket.assignedAgentName ??
                            context.l10n.unassigned,
                      ),
                      verticalSpace(8),
                      _buildMetaRow(
                        context,
                        icon: Icons.calendar_today_rounded,
                        label: context.l10n.createdAt,
                        value: formattedCreatedAt,
                      ),
                      verticalSpace(16),
                      // Status Action Button
                      AppButton(
                        text: isClosed
                            ? context.l10n.reopenTicket
                            : context.l10n.closeTicket,
                        icon: Icon(
                          isClosed
                              ? Icons.lock_open_rounded
                              : Icons.lock_outline_rounded,
                          size: 18,
                        ),
                        isLoading: _isUpdatingStatus,
                        backgroundColor: isClosed
                            ? colorScheme.primary
                            : colorScheme.errorContainer,
                        textColor: isClosed
                            ? colorScheme.onPrimary
                            : colorScheme.onErrorContainer,
                        height: 44,
                        onPressed: _onToggleStatus,
                      ),
                      verticalSpace(20),
                      // Tab Bar for Comments & Activities
                      TabBar(
                        onTap: (index) {
                          if (index == 0) {
                            context
                                .read<HomeCubit>()
                                .getTicketComments(widget.ticket.id);
                          } else if (index == 1) {
                            context
                                .read<HomeCubit>()
                                .getTicketActivities(widget.ticket.id);
                          }
                        },
                        controller: _tabController,
                        labelColor: colorScheme.primary,
                        unselectedLabelColor: colorScheme.onSurfaceVariant,
                        indicatorColor: colorScheme.primary,
                        indicatorWeight: 2.5,
                        tabs: [
                          Tab(
                            icon: const Icon(
                              Icons.chat_bubble_outline_rounded,
                              size: 18,
                            ),
                            text: context.l10n.comments,
                          ),
                          Tab(
                            icon: const Icon(Icons.history_rounded, size: 18),
                            text: context.l10n.activities,
                          ),
                        ],
                      ),
                      verticalSpace(12),
                      // Tab content container
                      AnimatedBuilder(
                        animation: _tabController,
                        builder: (context, _) {
                          return _tabController.index == 0
                              ? TicketCommentsSection(
                                  comments: _comments,
                                  isLoading: _isLoadingComments,
                                  ticketId: widget.ticket.id,
                                  isClosed: isClosed,
                                )
                              : TicketActivityTimelineSection(
                                  activities: _activities,
                                  isLoading: _isLoadingActivities,
                                );
                        },
                      ),
                      verticalSpace(20),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetaRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Row(
      children: [
        Icon(icon, size: 16, color: colorScheme.onSurfaceVariant),
        horizontalSpace(8),
        Text(
          '$label: ',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
