import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/adaptive_dialog_action.dart';
import 'core/adaptive_dialog_options.dart';

/// A dialog which adapts based on the platform on which is initialised.
///
/// It builds an [CupertinoAlertDialog] on iOS devices and [AlertDialog] on the rest of the platforms.
class SimpleAdaptiveDialog extends StatelessWidget {
  /// The title of the dialog.
  ///
  /// See [CupertinoAlertDialog.title] for iOS devices.
  /// See [AlertDialog.title] for non-iOS devices.
  final Widget? title;

  /// The content of the dialog.
  ///
  /// See [CupertinoAlertDialog.content] for iOS devices.
  /// See [AlertDialog.content] for non-iOS devices.
  final Widget? content;

  /// List of action buttons which are used to give the user choises to presses.
  ///
  /// See [CupertinoAlertDialog.actions] for iOS devices.
  /// See [AlertDialog.actions] for non-iOS devices.
  final List<AdaptiveDialogAction> actions;

  /// Options used to configure [AlertDialog].
  final MaterialDialogOptions materialOptions;

  /// Options used to configure [CupertinoAlertDialog].
  final CupertinoDialogOptions cupertinoOptions;

  /// The padding used for the content of the dialog.
  ///
  /// For iOS it uses `EdgeInsets.symmetric(vertical: 20)` as default value.
  /// For material it uses `EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0)` as default value.
  final EdgeInsetsGeometry? contentPadding;
  final Widget Function(BuildContext context, Widget child)? builder;

  /// Platform.isIOS crashes on web, so we need to make sure the platform is not a web browser.
  bool get _isIos => (!kIsWeb && Platform.isIOS);

  const SimpleAdaptiveDialog({
    Key? key,
    this.title,
    this.content,
    this.actions = const <AdaptiveDialogAction>[],
    this.materialOptions = const MaterialDialogOptions(),
    this.cupertinoOptions = const CupertinoDialogOptions(),
    this.contentPadding,
    this.builder,
  }) : super(key: key);

  EdgeInsetsGeometry get _contentPadding =>
      contentPadding ??
      (_isIos
          ? const EdgeInsets.symmetric(vertical: 20)
          : const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0));

  @override
  Widget build(BuildContext context) => _isIos ? _cupertinoDialog : _materialDialog;

  Widget get _cupertinoDialog => CupertinoAlertDialog(
        actionScrollController: cupertinoOptions.actionScrollController,
        insetAnimationCurve: cupertinoOptions.insetAnimationCurve,
        insetAnimationDuration: cupertinoOptions.insetAnimationDuration,
        scrollController: cupertinoOptions.scrollController,
        title: title,
        content: Padding(padding: _contentPadding, child: content),
        actions: actions,
      );

  Widget get _materialDialog => AlertDialog(
        titlePadding: materialOptions.titlePadding,
        titleTextStyle: materialOptions.titleTextStyle,
        contentPadding: _contentPadding,
        contentTextStyle: materialOptions.contentTextStyle,
        actionsAlignment: materialOptions.actionsAlignment,
        actionsOverflowButtonSpacing: materialOptions.actionsOverflowButtonSpacing,
        actionsOverflowDirection: materialOptions.actionsOverflowDirection,
        actionsPadding:
            materialOptions.actionsPadding ?? (kIsWeb ? const EdgeInsets.only(bottom: 8) : null),
        alignment: materialOptions.alignment,
        backgroundColor: materialOptions.backgroundColor,
        buttonPadding: materialOptions.buttonPadding,
        elevation: materialOptions.elevation,
        insetPadding: materialOptions.insetPadding,
        semanticLabel: materialOptions.semanticLabel,
        clipBehavior: materialOptions.clipBehavior,
        scrollable: materialOptions.scrollable,
        shape: materialOptions.shape,
        title: title,
        content: content,
        actions: actions,
      );

  Future<T?> show<T extends Object?>(BuildContext context) => showDialog(
        context: context,
        builder: (context) => (builder != null) ? builder!(context, this) : this,
        barrierDismissible: !_isIos,
      );

  static Future<bool> showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    String? cancelText,
    required String confirmText,
  }) async =>
      (await _SimpleConfirmationDialog(
        title: title,
        content: message,
        confirmText: confirmText,
        onSave: () => Navigator.maybePop(context, true),
        cancelText: cancelText,
        onCancel: () => Navigator.maybePop(context, false),
      ).show<bool>(context)) ??
      false;

  static Future<void> showNotification(
    BuildContext context, {
    required String title,
    required String message,
    String? buttonText,
  }) =>
      showConfirmation(
        context,
        title: title,
        message: message,
        confirmText: buttonText ?? "Close",
      );
}

class _SimpleConfirmationDialog extends SimpleAdaptiveDialog {
  _SimpleConfirmationDialog({
    Key? key,
    required String title,
    required String content,
    String? cancelText,
    required String confirmText,
    VoidCallback? onCancel,
    VoidCallback? onSave,
  }) : super(
          key: key,
          title: Text(title),
          content: Text(content),
          actions: [
            if (cancelText != null)
              AdaptiveDialogAction(
                child: Text(cancelText),
                onPressed: onCancel,
              ),
            AdaptiveDialogAction(
              child: Text(confirmText),
              onPressed: onSave,
            ),
          ],
        );
}
