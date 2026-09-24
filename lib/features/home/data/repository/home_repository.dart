import 'package:flutter/material.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../datasource/home_remote_data_source.dart';
import '../models/api_response_model.dart';
import '../models/create_ticket_request_model.dart';
import '../models/ticket_activity_response_model.dart';
import '../models/ticket_comment_response_model.dart';
import '../models/ticket_response_model.dart';
import '../models/tickets_pagination_response_model.dart';
import '../models/update_ticket_status_request_model.dart';

/// Repository responsible for managing all customer ticket operations.
///
/// This repository coordinates data retrieval from the remote data source
/// and converts network exceptions into [ApiResult] instances.
/// It should not contain business logic or data transformation.
class HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  const HomeRepository(this._homeRemoteDataSource);

  /// Retrieves the authenticated customer's tickets.
  ///
  /// Supports filtering, searching, sorting, and pagination.
  Future<ApiResult<TicketsPaginationResponseModel>> getTickets({
    String? status,
    String? priority,
    String? search,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? pageSize,
  }) async {
    try {
      final response = await _homeRemoteDataSource.getTickets(
        status: status,
        priority: priority,
        search: search,
        sortBy: sortBy,
        sortOrder: sortOrder,
        page: page,
        pageSize: pageSize,
      );

      return ApiResult.success(response);
    } catch (error) {
      debugPrint('HomeRepository getTickets error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Retrieves detailed information for a specific ticket.
  Future<ApiResult<TicketResponseModel>> getTicketById(
    String ticketId,
  ) async {
    try {
      final response = await _homeRemoteDataSource.getTicketById(ticketId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Creates a new support ticket.
  Future<ApiResult<TicketResponseModel>> createTicket(
    CreateTicketRequestModel request,
  ) async {
    try {
      final response = await _homeRemoteDataSource.createTicket(request);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Updates the status of an existing ticket.
  ///
  /// Customers can close or reopen their own tickets.
  Future<ApiResult<ApiResponseModel>> updateTicketStatus(
    String ticketId,
    UpdateTicketStatusRequestModel request,
  ) async {
    try {
      final response = await _homeRemoteDataSource.updateTicketStatus(
        ticketId,
        request,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Retrieves all comments associated with a ticket.
  Future<ApiResult<List<TicketCommentResponseModel>>> getTicketComments(
    String ticketId,
  ) async {
    try {
      final response = await _homeRemoteDataSource.getTicketComments(ticketId);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  /// Adds a new comment to an existing ticket.
Future<ApiResult<ApiResponseModel>> addComment(
  String ticketId,
   String content,
) async {
  try {
    final response = await _homeRemoteDataSource.addComment(
      ticketId,
      content,
    );

    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(
      ErrorHandler.handle(error),
    );
  }
}

  /// Retrieves the activity history (audit trail) for a ticket.
  Future<ApiResult<List<TicketActivityResponseModel>>> getTicketActivities(
    String ticketId,
  ) async {
    try {
      final response = await _homeRemoteDataSource.getTicketActivities(
        ticketId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}