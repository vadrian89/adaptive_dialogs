import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'adaptive_dialog_action_options.dart';

/// An adaptive widget which represents the actions for dialogs.
///
/// For Cupertino dialogs it builds a [CupertinoDialogAction].
/// For Material dialogs it builds a [TextButton].
class AdaptiveDialogAction extends StatelessWidget {
  /// See [CupertinoDialogAction.child] for iOS.
  /// See [TextButton.child] for non-iOS.
  final Widget child;

  /// See [CupertinoDialogAction.onPressed] for iOS.
  /// See [TextButton.onPressed] for non-iOS.
  final VoidCallback? onPressed;

  /// Custom configuration options used for material dialog action.
  final MaterialDialogActionOptions materialOptions;

  /// Custom configuration options used for iOS dialog action.
  final CupertinoDialogActionOptions cupertinoOptions;

  const AdaptiveDialogAction({
    Key? key,
    required this.child,
    required this.onPressed,
    this.materialOptions = const MaterialDialogActionOptions(),
    this.cupertinoOptions = const CupertinoDialogActionOptions(),
  }) : super(key: key);

  Widget get _cupertino => CupertinoDialogAction(
        isDefaultAction: cupertinoOptions.isDefaultAction,
        isDestructiveAction: cupertinoOptions.isDestructiveAction,
        textStyle: cupertinoOptions.textStyle,
        onPressed: onPressed,
        child: child,
      );

  Widget get _material => TextButton(
        autofocus: materialOptions.autofocus,
        clipBehavior: materialOptions.clipBehavior,
        focusNode: materialOptions.focusNode,
        onFocusChange: materialOptions.onFocusChange,
        onHover: materialOptions.onHover,
        onLongPress: materialOptions.onLongPress,
        style: materialOptions.style,
        onPressed: onPressed,
        child: child,
      );

  @override
  Widget build(BuildContext context) => (!kIsWeb && Platform.isIOS) ? _cupertino : _material;
}
