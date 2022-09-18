import 'package:flutter/material.dart';

/// Options used for the [AdaptiveDialogAction] action when on non-iOS devices (which use material style).
class MaterialDialogActionOptions {
  /// See [TextButton.onLongPress].
  final VoidCallback? onLongPress;

  /// See [TextButton.onHover].
  final ValueChanged<bool>? onHover;

  /// See [TextButton.onFocusChange].
  final ValueChanged<bool>? onFocusChange;

  /// See [TextButton.style].
  final ButtonStyle? style;

  /// See [TextButton.focusNode].
  final FocusNode? focusNode;

  /// See [TextButton.autofocus].
  final bool autofocus;

  /// See [TextButton.clipBehavior].
  final Clip clipBehavior;

  const MaterialDialogActionOptions({
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.autofocus = false,
    this.style,
    this.focusNode,
    this.clipBehavior = Clip.none,
  });
}

/// Options used for the [AdaptiveDialogAction] action when on iOS devices.
class CupertinoDialogActionOptions {
  /// See [CupertinoDialogAction.isDefaultAction].
  final bool isDefaultAction;

  /// See [CupertinoDialogAction.isDestructiveAction].
  final bool isDestructiveAction;

  /// See [CupertinoDialogAction.textStyle].
  final TextStyle? textStyle;

  const CupertinoDialogActionOptions({
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.textStyle,
  });
}
