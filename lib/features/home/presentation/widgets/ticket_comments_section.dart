import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/helpers/ui_feedback_helper.dart';
import '../../data/models/ticket_comment_response_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'comment_input_box.dart';

/// Renders a list of comments for a ticket along with a comment input box.
class TicketCommentsSection extends StatefulWidget {
  final List<TicketCommentResponseModel>? comments;
  final bool isLoading;
  final String? ticketId;
  final bool isClosed;
  final void Function(String content)? onAddComment;

  const TicketCommentsSection({
    super.key,
    required this.comments,
    this.isLoading = false,
    this.ticketId,
    this.isClosed = false,
    this.onAddComment,
  });

  @override
  State<TicketCommentsSection> createState() => _TicketCommentsSectionState();
}

class _TicketCommentsSectionState extends State<TicketCommentsSection> {
  late final TextEditingController _commentController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _onSendComment(String content) {
    if (widget.onAddComment != null) {
      widget.onAddComment!(content);
      return;
    }

    if (widget.ticketId != null) {
      setState(() {
        _isSubmitting = true;
      });
      context.read<HomeCubit>().addComment(widget.ticketId!, content);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          addCommentSuccess: (_) {
            setState(() {
              _isSubmitting = false;
            });
            _commentController.clear();
            // UIFeedbackHelper.showSuccessSnackBar(
            //   context: context,
            //   message: context.l10n.commentAddedSuccess,
            // );
            if (widget.ticketId != null) {
              final cubit = context.read<HomeCubit>();
              cubit.getTicketComments(widget.ticketId!);
              cubit.getTicketActivities(widget.ticketId!);
            }
          },
          addCommentFailure: (error) {
            setState(() {
              _isSubmitting = false;
            });
            // UIFeedbackHelper.showErrorSnackBar(
            //   context: context,
            //   message: error.message ?? '${context.l10n.errorOccurred}!',
            // );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isLoading)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator.adaptive()),
            )
          else if (widget.comments == null || widget.comments!.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 36,
                      color: colorScheme.outlineVariant,
                    ),
                    verticalSpace(8),
                    Text(
                      context.l10n.noComments,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: widget.comments!.length,
              separatorBuilder: (_, index) => verticalSpace(10),
              itemBuilder: (context, index) {
                final comment = widget.comments![index];
                return _CommentCard(comment: comment);
              },
            ),
          verticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: widget.isClosed
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          size: 18,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        horizontalSpace(8),
                        Expanded(
                          child: Text(
                            context.l10n.statusClosed,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : CommentInputBox(
                    controller: _commentController,
                    isLoading: _isSubmitting,
                    onSend: _onSendComment,
                  ),
          ),
        ],
      ),
    );
  }
}

class _CommentCard extends StatelessWidget {
  final TicketCommentResponseModel comment;

  const _CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final formattedDate = DateFormat(
      'MMM d, yyyy • h:mm a',
    ).format(comment.createdAt.toLocal());

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.isDarkMode
            ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.4)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: colorScheme.primaryContainer,
                child: Text(
                  comment.userName.isNotEmpty
                      ? comment.userName[0].toUpperCase()
                      : 'U',
                  style: textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Text(
                  comment.userName,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                formattedDate,
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
          verticalSpace(8),
          Text(
            comment.content,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
