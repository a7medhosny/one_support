import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/get_it.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../data/models/ticket_response_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/create_ticket_bottom_sheet.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_bloc_listener.dart';
import '../widgets/ticket_filters_bar.dart';
import '../widgets/ticket_search_bar.dart';
import '../widgets/ticket_stats_overview.dart';
import '../widgets/tickets_list_view.dart';

/// Root Page for the Home feature displaying support tickets.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..getTickets(),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  String? _selectedStatus;
  String? _selectedPriority;
  String? _searchQuery;

  List<TicketResponseModel> _allTickets = [];
  int _totalCount = 0;
  bool _isLoading = true;
  String? _errorMessage;

  void _fetchTickets() {
    context.read<HomeCubit>().getTickets(
      status: _selectedStatus,
      priority: _selectedPriority,
      search: _searchQuery,
    );
  }

  void _onStatusChanged(String? status) {
    setState(() {
      _selectedStatus = status;
    });
    _fetchTickets();
  }

  void _onPriorityChanged(String? priority) {
    setState(() {
      _selectedPriority = priority;
    });
    _fetchTickets();
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query.isEmpty ? null : query;
    });
    _fetchTickets();
  }

  void _onClearSearch() {
    setState(() {
      _searchQuery = null;
    });
    _fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return HomeBlocListener(
      onRefreshNeeded: _fetchTickets,
      child: Scaffold(
        appBar: const HomeAppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => CreateTicketBottomSheet.show(context),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          icon: const Icon(Icons.add_rounded),
          label: Text(
            context.l10n.newTicket,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Ticket Stats Cards
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  debugPrint('HomeState changed: $state');
                  state.whenOrNull(
                    getTicketsLoading: () {
                      setState(() {
                        _isLoading = true;
                        _errorMessage = null;
                      });
                    },
                    getTicketsSuccess: (data) {
                      setState(() {
                        _allTickets = data.items;
                        _totalCount = data.totalCount;
                        _isLoading = false;
                        _errorMessage = null;
                      });
                    },
                    getTicketsFailure: (error) {
                      setState(() {
                        _isLoading = false;
                        _errorMessage =
                            error.message ?? context.l10n.errorOccurred;
                      });
                    },
                  );
                },
                builder: (context, state) {
                  return TicketStatsOverview(
                    tickets: _allTickets,
                    totalCount: _totalCount > 0
                        ? _totalCount
                        : _allTickets.length,
                  );
                },
              ),
              verticalSpace(4),
              // Search Input
              TicketSearchBar(
                onSearch: _onSearch,
                onClear: _onClearSearch,
                initialValue: _searchQuery,
              ),
              verticalSpace(4),
              // Filter Chips
              TicketFiltersBar(
                selectedStatus: _selectedStatus,
                selectedPriority: _selectedPriority,
                onStatusChanged: _onStatusChanged,
                onPriorityChanged: _onPriorityChanged,
              ),
              verticalSpace(8),
              // Tickets List View
              Expanded(
                child: TicketsListView(
                  tickets: _allTickets,
                  isLoading: _isLoading,
                  errorMessage: _errorMessage,
                  onRefresh: () async => _fetchTickets(),
                  onRetry: _fetchTickets,
                  onCreateTicket: () => CreateTicketBottomSheet.show(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
