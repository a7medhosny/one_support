import 'package:flutter/material.dart';

import '../../../../../../core/helpers/extensions.dart';

/// A sleek and modern comment input box with multiline support,
/// dynamic submit button states, and loading indicators.
class CommentInputBox extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSend;
  final VoidCallback? onSubmit;
  final bool isLoading;
  final bool enabled;
  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final bool autofocus;

  const CommentInputBox({
    super.key,
    this.controller,
    this.focusNode,
    this.onSend,
    this.onSubmit,
    this.isLoading = false,
    this.enabled = true,
    this.hintText,
    this.margin,
    this.autofocus = false,
  });

  @override
  State<CommentInputBox> createState() => _CommentInputBoxState();
}

class _CommentInputBoxState extends State<CommentInputBox> {
  TextEditingController? _internalController;
  TextEditingController get _effectiveController =>
      widget.controller ?? (_internalController ??= TextEditingController());

  bool _canSubmit = false;

  @override
  void initState() {
    super.initState();
    _effectiveController.addListener(_onTextChanged);
    _checkCanSubmit();
  }

  @override
  void didUpdateWidget(covariant CommentInputBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      if (oldWidget.controller == null) {
        _internalController?.removeListener(_onTextChanged);
        _internalController?.dispose();
        _internalController = null;
      } else {
        oldWidget.controller!.removeListener(_onTextChanged);
      }

      _effectiveController.addListener(_onTextChanged);
      _checkCanSubmit();
    }
  }

  void _onTextChanged() {
    _checkCanSubmit();
  }

  void _checkCanSubmit() {
    final canSubmit = _effectiveController.text.trim().isNotEmpty;
    if (canSubmit != _canSubmit) {
      setState(() {
        _canSubmit = canSubmit;
      });
    }
  }

  void _handleSend() {
    final text = _effectiveController.text.trim();
    if (text.isEmpty || widget.isLoading || !widget.enabled) return;

    widget.onSend?.call(text);
    widget.onSubmit?.call();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController?.removeListener(_onTextChanged);
      _internalController?.dispose();
    } else {
      widget.controller!.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final isDark = context.isDarkMode;

    final isButtonEnabled = _canSubmit && !widget.isLoading && widget.enabled;

    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.35)
            : colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.only(left: 14, right: 6, top: 6, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: _effectiveController,
                focusNode: widget.focusNode,
                enabled: widget.enabled,
                autofocus: widget.autofocus,
                minLines: 1,
                maxLines: 4,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  height: 1.35,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText ?? context.l10n.writeComment,
                  hintStyle: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.65),
                  ),
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Material(
            color: isButtonEnabled
                ? colorScheme.primary
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: isButtonEnabled ? _handleSend : null,
              child: SizedBox(
                width: 38,
                height: 38,
                child: Center(
                  child: widget.isLoading
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator.adaptive(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              colorScheme.onPrimary,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.send_rounded,
                          size: 18,
                          color: isButtonEnabled
                              ? colorScheme.onPrimary
                              : colorScheme.onSurfaceVariant.withValues(
                                  alpha: 0.4,
                                ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
