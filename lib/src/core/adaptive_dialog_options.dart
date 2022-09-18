import 'package:flutter/widgets.dart';

/// Options used for material dialogs.
///
/// The default values are copied from [AlertDialog] to keep a consistent experience.
class MaterialDialogOptions {
  /// See [AlertDialog.titlePadding].
  final EdgeInsetsGeometry? titlePadding;

  /// See [AlertDialog.titleTextStyle].
  final TextStyle? titleTextStyle;

  /// See [AlertDialog.contentTextStyle].
  final TextStyle? contentTextStyle;

  /// See [AlertDialog.actionsPadding].
  final EdgeInsetsGeometry actionsPadding;

  /// See [AlertDialog.actionsAlignment].
  final MainAxisAlignment? actionsAlignment;

  /// See [AlertDialog.actionsOverflowDirection].
  final VerticalDirection? actionsOverflowDirection;

  /// See [AlertDialog.actionsOverflowButtonSpacing].
  final double? actionsOverflowButtonSpacing;

  /// See [AlertDialog.buttonPadding].
  final EdgeInsetsGeometry? buttonPadding;

  /// See [AlertDialog.backgroundColor].
  final Color? backgroundColor;

  /// See [AlertDialog.elevation].
  final double? elevation;

  /// See [AlertDialog.semanticLabel].
  final String? semanticLabel;

  /// See [AlertDialog.insetPadding].
  final EdgeInsets insetPadding;

  /// See [AlertDialog.clipBehavior].
  final Clip clipBehavior;

  /// See [AlertDialog.shape].
  final ShapeBorder? shape;

  /// See [AlertDialog.alignment].
  final AlignmentGeometry? alignment;

  /// See [AlertDialog.scrollable].
  final bool scrollable;

  /// Create a new [MaterialDialogOptions] used to configure the [AlertDialog] shown.
  const MaterialDialogOptions({
    this.titlePadding,
    this.clipBehavior = Clip.none,
    this.titleTextStyle,
    this.contentTextStyle,
    this.actionsPadding = EdgeInsets.zero,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.insetPadding = const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.shape,
    this.alignment,
    this.scrollable = false,
  });
}

/// Options used for iOS/macOS dialogs.
///
/// The default values are copied from [CupertinoAlertDialog] to keep a consistent experience.
class CupertinoDialogOptions {
  /// See [CupertinoAlertDialog.scrollController].
  final ScrollController? scrollController;

  /// See [CupertinoAlertDialog.actionScrollController].
  final ScrollController? actionScrollController;

  /// See [CupertinoAlertDialog.insetAnimationDuration].
  final Duration insetAnimationDuration;

  /// See [CupertinoAlertDialog.insetAnimationCurve].
  final Curve insetAnimationCurve;

  /// Create a new [CupertinoDialogOptions] used to configure the [CupertinoAlertDialog] shown.
  const CupertinoDialogOptions({
    this.scrollController,
    this.actionScrollController,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
  });
}
