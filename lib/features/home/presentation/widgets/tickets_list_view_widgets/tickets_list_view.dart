import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../data/models/ticket_response_model.dart';
import 'ticket_card.dart';
import 'ticket_empty_state.dart';
import 'ticket_error_state.dart';
import 'ticket_shimmer_loading.dart';

/// List view coordinating loading, error, empty, and data states for tickets.
class TicketsListView extends StatelessWidget {
  final List<TicketResponseModel>? tickets;
  final bool isLoading;
  final String? errorMessage;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final VoidCallback onCreateTicket;

  const TicketsListView({
    super.key,
    required this.tickets,
    required this.isLoading,
    this.errorMessage,
    required this.onRefresh,
    required this.onRetry,
    required this.onCreateTicket,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('TicketsListView build called with isLoading: $isLoading, errorMessage: $errorMessage, tickets length: ${tickets?.length ?? 0}');
    if (isLoading && (tickets == null || tickets!.isEmpty)) {
      return const TicketShimmerLoading();
    }

    if (errorMessage != null && (tickets == null || tickets!.isEmpty)) {
      return TicketErrorState(errorMessage: errorMessage!, onRetry: onRetry);
    }

    if (tickets == null || tickets!.isEmpty) {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: TicketEmptyState(onCreateTicket: onCreateTicket),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: tickets!.length,
        separatorBuilder: (_, index) => verticalSpace(12),
        itemBuilder: (context, index) {
          final ticket = tickets![index];
          return TicketCard(ticket: ticket);
        },
      ),
    );
  }
}
