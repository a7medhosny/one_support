import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_result.dart';
import '../../data/models/create_ticket_request_model.dart';
import '../../data/models/update_ticket_status_request_model.dart';
import '../../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState.initial());

  /// Retrieves the authenticated customer's tickets.
  ///
  /// Supports filtering, searching, sorting, and pagination.
  Future<void> getTickets({
    String? status,
    String? priority,
    String? search,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? pageSize,
  }) async {
    emit(const HomeState.getTicketsLoading());

    final result = await _homeRepository.getTickets(
      status: status,
      priority: priority,
      search: search,
      sortBy: sortBy,
      sortOrder: sortOrder,
      page: page,
      pageSize: pageSize,
    );

    switch (result) {
      case Success(:final data):
        emit(HomeState.getTicketsSuccess(data));

      case Failure(:final errorHandler):
        debugPrint(
          'HomeCubit getTickets error: ${errorHandler.apiErrorModel.message}',
        );
        emit(HomeState.getTicketsFailure(errorHandler.apiErrorModel));
    }
  }

  /// Retrieves detailed information for a specific ticket.
  Future<void> getTicketById(String ticketId) async {
    emit(const HomeState.getTicketByIdLoading());

    final result = await _homeRepository.getTicketById(ticketId);

    switch (result) {
      case Success(:final data):
        emit(HomeState.getTicketByIdSuccess(data));

      case Failure(:final errorHandler):
        emit(HomeState.getTicketByIdFailure(errorHandler.apiErrorModel));
    }
  }

  /// Creates a new support ticket.
  Future<void> createTicket(CreateTicketRequestModel request) async {
    emit(const HomeState.createTicketLoading());

    final result = await _homeRepository.createTicket(request);

    switch (result) {
      case Success(:final data):
        emit(HomeState.createTicketSuccess(data));

      case Failure(:final errorHandler):
        emit(HomeState.createTicketFailure(errorHandler.apiErrorModel));
    }
  }

  /// Updates the status of an existing ticket.
  ///
  /// Customers can close or reopen their own tickets.
  Future<void> updateTicketStatus(
    String ticketId,
    UpdateTicketStatusRequestModel request,
  ) async {
    emit(const HomeState.updateTicketStatusLoading());

    final result = await _homeRepository.updateTicketStatus(ticketId, request);

    switch (result) {
      case Success(:final data):
        emit(HomeState.updateTicketStatusSuccess(data));

      case Failure(:final errorHandler):
        emit(HomeState.updateTicketStatusFailure(errorHandler.apiErrorModel));
    }
  }

  /// Retrieves all comments associated with a specific ticket.
  Future<void> getTicketComments(String ticketId) async {
    emit(const HomeState.getTicketCommentsLoading());

    final result = await _homeRepository.getTicketComments(ticketId);

    switch (result) {
      case Success(:final data):
        emit(HomeState.getTicketCommentsSuccess(data));

      case Failure(:final errorHandler):
        emit(HomeState.getTicketCommentsFailure(errorHandler.apiErrorModel));
    }
  }

  /// Adds a new comment to a specific ticket.
  Future<void> addComment(
    String ticketId,
    String content,
  ) async {
    emit(const HomeState.addCommentLoading());

    final result = await _homeRepository.addComment(ticketId, content);

    switch (result) {
      case Success(:final data):
        emit(HomeState.addCommentSuccess(data));

      case Failure(:final errorHandler):
        emit(HomeState.addCommentFailure(errorHandler.apiErrorModel));
    }
  }

  /// Retrieves the activity history (audit trail) for a specific ticket.
  Future<void> getTicketActivities(String ticketId) async {
    emit(const HomeState.getTicketActivitiesLoading());

    final result = await _homeRepository.getTicketActivities(ticketId);

    switch (result) {
      case Success(:final data):
        emit(HomeState.getTicketActivitiesSuccess(data));

      case Failure(:final errorHandler):
        emit(HomeState.getTicketActivitiesFailure(errorHandler.apiErrorModel));
    }
  }
}
