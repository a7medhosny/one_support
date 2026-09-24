import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../models/api_response_model.dart';
import '../models/create_ticket_request_model.dart';
import '../models/ticket_activity_response_model.dart';
import '../models/ticket_comment_response_model.dart';
import '../models/ticket_response_model.dart';
import '../models/tickets_pagination_response_model.dart';
import '../models/update_ticket_status_request_model.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  /// Retrieves a paginated list of tickets.
  ///
  /// Results are filtered based on the authenticated user's role:
  /// - Admins can view all tickets.
  /// - Agents can view only assigned tickets.
  /// - Customers can view only their own tickets.
  @GET(ApiEndpoints.tickets)
  Future<TicketsPaginationResponseModel> getTickets(
    @Query('Status') String? status,
    @Query('Priority') String? priority,
    @Query('Search') String? search,
    @Query('SortBy') String? sortBy,
    @Query('SortOrder') String? sortOrder,
    @Query('Page') int? page,
    @Query('PageSize') int? pageSize,
  );

  /// Retrieves a specific ticket by its unique identifier.
  ///
  /// Access is restricted based on the authenticated user's role
  /// and ownership or assignment of the requested ticket.
  @GET('${ApiEndpoints.tickets}/{id}')
  Future<TicketResponseModel> getTicketById(
    @Path('id') String id,
  );

  /// Creates a new support ticket.
  ///
  /// Only users with the Customer role are authorized to create tickets.
  @POST(ApiEndpoints.tickets)
  Future<TicketResponseModel> createTicket(
    @Body() CreateTicketRequestModel request,
  );



  /// Updates the status of an existing ticket.
  ///
  /// Role-based permissions apply:
  /// - Admin: Can set any ticket status.
  /// - Support Agent: Can resolve assigned tickets.
  /// - Customer: Can close or reopen their own tickets.
  @PATCH('${ApiEndpoints.tickets}/{id}/status')
  Future<ApiResponseModel> updateTicketStatus(
    @Path('id') String id,
    @Body() UpdateTicketStatusRequestModel request,
  );


  /// Retrieves the chronological list of comments for a specific ticket.
  ///
  /// Users can only view comments for tickets they have permission to access.
  @GET('${ApiEndpoints.tickets}/{ticketId}/comments')
  Future<List<TicketCommentResponseModel>> getTicketComments(
    @Path('ticketId') String ticketId,
  );

  /// Adds a new comment to a specific support ticket.
///
/// The authenticated user must have permission to access
/// the specified ticket.
@POST('${ApiEndpoints.tickets}/{ticketId}/comments')
Future<ApiResponseModel> addComment(
  @Path('ticketId') String ticketId,
  @Body() Map<String, String> request,
);


  /// Retrieves the chronological history of activities (audit trail)
  /// for a specific ticket.
  ///
  /// Users can only view the activity timeline for tickets they
  /// have permission to access.
  @GET('${ApiEndpoints.tickets}/{ticketId}/activities')
  Future<List<TicketActivityResponseModel>> getTicketActivities(
    @Path('ticketId') String ticketId,
  );
}