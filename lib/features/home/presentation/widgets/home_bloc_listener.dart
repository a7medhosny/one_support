import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/ui_feedback_helper.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

/// Centralized BlocListener for Home feature side-effects.
class HomeBlocListener extends StatelessWidget {
  final Widget child;
  final VoidCallback onRefreshNeeded;

  const HomeBlocListener({
    super.key,
    required this.child,
    required this.onRefreshNeeded,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          createTicketSuccess: (_) {
            UIFeedbackHelper.showSuccessSnackBar(
              context: context,
              message: context.l10n.ticketCreatedSuccess,
            );
            onRefreshNeeded();
          },
          createTicketFailure: (error) {
            UIFeedbackHelper.showErrorSnackBar(
              context: context,
              message: error.message ?? context.l10n.errorOccurred,
            );
          },
          updateTicketStatusSuccess: (_) {
            UIFeedbackHelper.showSuccessSnackBar(
              context: context,
              message: context.l10n.ticketStatusUpdated,
            );
            onRefreshNeeded();
          },
          updateTicketStatusFailure: (error) {
            UIFeedbackHelper.showErrorSnackBar(
              context: context,
              message: error.message ?? context.l10n.errorOccurred,
            );
          },
          getTicketsFailure: (error) {
            UIFeedbackHelper.showErrorSnackBar(
              context: context,
              message: error.message ?? context.l10n.errorOccurred,
            );
          },
        );
      },
      child: child,
    );
  }
}
