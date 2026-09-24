import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';
import '../../data/models/api_response_model.dart';
import '../../data/models/ticket_activity_response_model.dart';
import '../../data/models/ticket_comment_response_model.dart';
import '../../data/models/ticket_response_model.dart';
import '../../data/models/tickets_pagination_response_model.dart';

part 'home_state.freezed.dart';


@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Tickets
  const factory HomeState.getTicketsLoading() = _GetTicketsLoading;
  const factory HomeState.getTicketsSuccess(
    TicketsPaginationResponseModel tickets,
  ) = _GetTicketsSuccess;
  const factory HomeState.getTicketsFailure(
    ApiErrorModel error,
  ) = _GetTicketsFailure;

  // Ticket Details
  const factory HomeState.getTicketByIdLoading() = _GetTicketByIdLoading;
  const factory HomeState.getTicketByIdSuccess(
    TicketResponseModel ticket,
  ) = _GetTicketByIdSuccess;
  const factory HomeState.getTicketByIdFailure(
    ApiErrorModel error,
  ) = _GetTicketByIdFailure;

  // Create Ticket
  const factory HomeState.createTicketLoading() = _CreateTicketLoading;
  const factory HomeState.createTicketSuccess(
    TicketResponseModel ticket,
  ) = _CreateTicketSuccess;
  const factory HomeState.createTicketFailure(
    ApiErrorModel error,
  ) = _CreateTicketFailure;

  // Update Status
  const factory HomeState.updateTicketStatusLoading()
      = _UpdateTicketStatusLoading;
  const factory HomeState.updateTicketStatusSuccess(
    ApiResponseModel response,
  ) = _UpdateTicketStatusSuccess;
  const factory HomeState.updateTicketStatusFailure(
    ApiErrorModel error,
  ) = _UpdateTicketStatusFailure;

  // Comments
  const factory HomeState.getTicketCommentsLoading()
      = _GetTicketCommentsLoading;
  const factory HomeState.getTicketCommentsSuccess(
    List<TicketCommentResponseModel> comments,
  ) = _GetTicketCommentsSuccess;
  const factory HomeState.getTicketCommentsFailure(
    ApiErrorModel error,
  ) = _GetTicketCommentsFailure;

  const factory HomeState.addCommentLoading() =
    _AddCommentLoading;

const factory HomeState.addCommentSuccess(
  ApiResponseModel response,
) = _AddCommentSuccess;

const factory HomeState.addCommentFailure(
  ApiErrorModel apiErrorModel,
) = _AddCommentFailure;



  // Activities
  const factory HomeState.getTicketActivitiesLoading()
      = _GetTicketActivitiesLoading;
  const factory HomeState.getTicketActivitiesSuccess(
    List<TicketActivityResponseModel> activities,
  ) = _GetTicketActivitiesSuccess;
  const factory HomeState.getTicketActivitiesFailure(
    ApiErrorModel error,
  ) = _GetTicketActivitiesFailure;
}