import '../models/api_response_model.dart';
import '../models/create_ticket_request_model.dart';
import '../models/ticket_activity_response_model.dart';
import '../models/ticket_comment_response_model.dart';
import '../models/ticket_response_model.dart';
import '../models/tickets_pagination_response_model.dart';
import '../models/update_ticket_status_request_model.dart';
import 'home_api_service.dart';

/// Handles all remote data operations related to the Home feature.
///
/// This data source communicates directly with the REST API through
/// [HomeApiService] and returns raw response models.
class HomeRemoteDataSource {
  final HomeApiService _homeApiService;

  const HomeRemoteDataSource(this._homeApiService);

  Future<TicketsPaginationResponseModel> getTickets({
    String? status,
    String? priority,
    String? search,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? pageSize,
  }) async {
    return await _homeApiService.getTickets(
      status,
      priority,
      search,
      sortBy,
      sortOrder,
      page,
      pageSize,
    );
  }

  Future<TicketResponseModel> getTicketById(String ticketId) async {
    return await _homeApiService.getTicketById(ticketId);
  }

  Future<TicketResponseModel> createTicket(
    CreateTicketRequestModel request,
  ) async {
    return await _homeApiService.createTicket(request);
  }

  Future<ApiResponseModel> updateTicketStatus(
    String ticketId,
    UpdateTicketStatusRequestModel request,
  ) async {
    return await _homeApiService.updateTicketStatus(ticketId, request);
  }

  Future<List<TicketCommentResponseModel>> getTicketComments(
    String ticketId,
  ) async {
    return await _homeApiService.getTicketComments(ticketId);
  }

  Future<ApiResponseModel> addComment(String ticketId, String content) async {
    return await _homeApiService.addComment(ticketId, {"content": content});
  }

  Future<List<TicketActivityResponseModel>> getTicketActivities(
    String ticketId,
  ) async {
    return await _homeApiService.getTicketActivities(ticketId);
  }
}
