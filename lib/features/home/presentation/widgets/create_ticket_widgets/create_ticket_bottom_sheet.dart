import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/extensions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../data/models/create_ticket_request_model.dart';
import '../../cubit/home_cubit.dart';
import '../../cubit/home_state.dart';

/// Modal bottom sheet form for creating a new support ticket.
class CreateTicketBottomSheet extends StatefulWidget {
  const CreateTicketBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
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
          child: const CreateTicketBottomSheet(),
        );
      },
    );
  }

  @override
  State<CreateTicketBottomSheet> createState() =>
      _CreateTicketBottomSheetState();
}

class _CreateTicketBottomSheetState extends State<CreateTicketBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final FocusNode _descriptionFocusNode;
  TicketPriority _selectedPriority = TicketPriority.medium;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _descriptionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      setState(() {
        _isLoading = true;
      });

      final request = CreateTicketRequestModel(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        priority: _selectedPriority,
      );

      context.read<HomeCubit>().createTicket(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        state.whenOrNull(
          createTicketSuccess: (_) {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pop();
          },
          createTicketFailure: (_) {
            setState(() {
              _isLoading = false;
            });
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.createTicket,
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
                const Divider(),
                verticalSpace(12),
                // Title Field
                Text(
                  context.l10n.ticketTitle,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(6),
                AppTextFormField(
                  controller: _titleController,
                  hintText: context.l10n.ticketTitleHint,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.l10n.ticketTitleRequired;
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                ),
                verticalSpace(16),
                // Description Field
                Text(
                  context.l10n.ticketDescription,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(6),
                AppTextFormField(
                  controller: _descriptionController,
                  focusNode: _descriptionFocusNode,
                  hintText: context.l10n.ticketDescriptionHint,
                  maxLines: 4,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return context.l10n.ticketDescriptionRequired;
                    }
                    return null;
                  },
                ),
                verticalSpace(16),
                // Priority Selector
                Text(
                  context.l10n.priority,
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildPriorityChoice(
                        context,
                        priority: TicketPriority.low,
                        label: context.l10n.priorityLow,
                        color: const Color(0xFF2E7D32),
                      ),
                      horizontalSpace(8),
                      _buildPriorityChoice(
                        context,
                        priority: TicketPriority.medium,
                        label: context.l10n.priorityMedium,
                        color: const Color(0xFFF57F17),
                      ),
                      horizontalSpace(8),
                      _buildPriorityChoice(
                        context,
                        priority: TicketPriority.high,
                        label: context.l10n.priorityHigh,
                        color: const Color(0xFFC62828),
                      ),
                      horizontalSpace(8),
                      _buildPriorityChoice(
                        context,
                        priority: TicketPriority.critical,
                        label: context.l10n.priorityCritical,
                        color: const Color(0xFFB71C1C),
                      ),
                    ],
                  ),
                ),
                verticalSpace(24),
                // Submit Button
                AppButton(
                  text: context.l10n.createTicket,
                  icon: const Icon(Icons.add_task_rounded, size: 20),
                  isLoading: _isLoading,
                  onPressed: _onSubmit,
                ),
                verticalSpace(16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriorityChoice(
    BuildContext context, {
    required TicketPriority priority,
    required String label,
    required Color color,
  }) {
    final isSelected = _selectedPriority == priority;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      showCheckmark: isSelected,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : color,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
      ),
      selectedColor: color,
      backgroundColor: color.withValues(alpha: 0.1),
      side: BorderSide(color: color.withValues(alpha: isSelected ? 1.0 : 0.4)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedPriority = priority;
          });
        }
      },
    );
  }
}
