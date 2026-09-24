import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

/// Clean search bar for filtering tickets by query.
class TicketSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final VoidCallback onClear;
  final String? initialValue;

  const TicketSearchBar({
    super.key,
    required this.onSearch,
    required this.onClear,
    this.initialValue,
  });

  @override
  State<TicketSearchBar> createState() => _TicketSearchBarState();
}

class _TicketSearchBarState extends State<TicketSearchBar> {
  late final TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_handleTextChange);
  }

  void _handleTextChange() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: AppTextFormField(
        controller: _controller,
        hintText: context.l10n.searchTickets,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: context.colorScheme.onSurfaceVariant,
        ),
        suffixIcon: _hasText
            ? IconButton(
                icon: const Icon(Icons.close_rounded, size: 20),
                onPressed: () {
                  _controller.clear();
                  widget.onClear();
                },
              )
            : null,
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) => widget.onSearch(value.trim()),
        onChanged: (value) {
          if (value.isEmpty) {
            widget.onClear();
          }
        },
      ),
    );
  }
}
