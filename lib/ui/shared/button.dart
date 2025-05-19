import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoguide/ui/shared/theme/app_colors.dart';
import 'package:geoguide/ui/shared/theme/app_theme.dart';
import 'package:geoguide/ui/shared/theme/app_typography.dart';

enum ButtonType { outlined, primary, text, link }

class Button extends StatelessWidget {
  /// Creates a outlined button
  const Button.outlined({
    super.key,
    required this.content,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.overlayColor,
    this.padding,
    this.alignment,
    this.expand = false,
    this.minimumSize,
    this.prefixPadding,
    this.suffixPadding,
    this.borderRadius,
    Color? borderColor,
    Color? backgroundColor,
    Color? color,
  })  : _type = ButtonType.outlined,
        borderColor = borderColor ?? AppTheme.outlinedButtonDefaultBorderColor,
        backgroundColor = backgroundColor ?? AppColors.transparent,
        color = color ?? AppColors.black10,
        isRounded = false;

  /// Creates a primary button
  const Button.primary({
    super.key,
    required this.content,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.overlayColor,
    this.padding,
    this.alignment,
    this.expand = false,
    this.minimumSize,
    this.prefixPadding,
    this.suffixPadding,
    this.borderRadius,
    Color? backgroundColor,
    Color? color,
  })  : _type = ButtonType.primary,
        backgroundColor = backgroundColor ?? AppColors.primary,
        color = color ?? AppColors.white500,
        borderColor = null,
        isRounded = false;

  /// Creates a text button
  ///
  /// Default value for [borderColor] and [backgroundColor] are transparent.
  const Button.text({
    super.key,
    required this.content,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.overlayColor,
    this.padding,
    this.alignment,
    this.expand = false,
    this.minimumSize,
    this.prefixPadding,
    this.suffixPadding,
    this.borderRadius,
    Color? color,
  })  : _type = ButtonType.text,
        backgroundColor = AppColors.transparent,
        borderColor = AppColors.transparent,
        color = color ?? AppColors.grey500,
        isRounded = false;

  /// Creates a link button
  ///
  /// Default value for [borderColor] and [backgroundColor] are transparent.
  const Button.link({
    super.key,
    required this.content,
    required this.onPressed,
    this.prefix,
    this.suffix,
    this.overlayColor,
    this.padding,
    this.alignment,
    this.prefixPadding,
    this.suffixPadding,
    this.borderRadius,
    this.expand = false,
    this.minimumSize,
  })  : _type = ButtonType.link,
        borderColor = AppColors.transparent,
        backgroundColor = AppColors.transparent,
        color = AppColors.backgroundText,
        isRounded = false;

  /// Creates a button of [type]
  factory Button.ofType({
    Key? key,
    required ButtonType type,
    required Widget content,
    required VoidCallback? onPressed,
    Widget? prefix,
    Widget? suffix,
    EdgeInsetsGeometry? padding,
    MainAxisAlignment? alignment,
    bool expand = false,
    Size? minimumSize,
    Color? color,
    Color? backgroundColor,
    Color? borderColor,
    EdgeInsetsGeometry? prefixPadding,
    EdgeInsetsGeometry? suffixPadding,
    Color? overlayColor,
    BorderRadiusGeometry? borderRadius,
  }) {
    switch (type) {
      case ButtonType.primary:
        return Button.primary(
          key: key,
          content: content,
          onPressed: onPressed,
          prefix: prefix,
          suffix: suffix,
          padding: padding,
          alignment: alignment,
          expand: expand,
          minimumSize: minimumSize,
          prefixPadding: prefixPadding,
          suffixPadding: suffixPadding,
          color: color,
          backgroundColor: backgroundColor,
          overlayColor: overlayColor,
          borderRadius: borderRadius,
        );
      case ButtonType.outlined:
        return Button.outlined(
          key: key,
          content: content,
          onPressed: onPressed,
          prefix: prefix,
          suffix: suffix,
          padding: padding,
          alignment: alignment,
          expand: expand,
          minimumSize: minimumSize,
          prefixPadding: prefixPadding,
          suffixPadding: suffixPadding,
          color: color,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          overlayColor: overlayColor,
          borderRadius: borderRadius,
        );
      case ButtonType.text:
        return Button.text(
          key: key,
          content: content,
          onPressed: onPressed,
          prefix: prefix,
          suffix: suffix,
          padding: padding,
          alignment: alignment,
          expand: expand,
          minimumSize: minimumSize,
          prefixPadding: prefixPadding,
          suffixPadding: suffixPadding,
          color: color,
          overlayColor: overlayColor,
          borderRadius: borderRadius,
        );
      case ButtonType.link:
        return Button.link(
          key: key,
          content: content,
          onPressed: onPressed,
          prefix: prefix,
          suffix: suffix,
          padding: padding,
          alignment: alignment,
          expand: expand,
          minimumSize: minimumSize,
          prefixPadding: prefixPadding,
          suffixPadding: suffixPadding,
          overlayColor: overlayColor,
          borderRadius: borderRadius,
        );
    }
  }

  /// The internal type of the button, defined in each constructor
  final ButtonType _type;

  /// Widget to be rendered before the [content]
  final Widget? prefix;

  /// Widget to be rendered after the [content]
  final Widget? suffix;

  /// The content of the button
  final Widget content;

  /// Function to be called on pressed.
  ///
  /// If null the button assumes disabled state
  final VoidCallback? onPressed;

  /// The color of the border
  final Color? borderColor;

  /// The color of the background
  final Color backgroundColor;

  /// The foreground color.
  ///
  /// Automatically applied to text, svg and icons
  final Color color;

  /// The padding of the button.
  ///
  /// The default value of `EdgeInsets.symmetric(horizontal: 15, vertical: 8)`
  final EdgeInsetsGeometry? padding;

  /// The splash color.
  ///
  /// If null, this value is calculated based on the button
  /// type and colors
  final Color? overlayColor;

  /// If the internal Row should expand to fill available space
  final bool expand;

  /// The alignment of the button content
  final MainAxisAlignment? alignment;

  /// The minimum size of the button
  final Size? minimumSize;

  /// The padding around the prefix widget
  ///
  /// Defaults to: `const EdgeInsets.only(right: 8)`
  final EdgeInsetsGeometry? prefixPadding;

  /// The padding around the suffix widget
  ///
  /// Defaults to: `const EdgeInsets.only(left: 8)`
  final EdgeInsetsGeometry? suffixPadding;

  /// The border radius of the button
  final BorderRadiusGeometry? borderRadius;

  final bool isRounded;

  bool get _isPrimary => _type == ButtonType.primary;
  bool get _isLink => _type == ButtonType.link;
  bool get _isText => _type == ButtonType.text;
  bool get _isOutlined => _type == ButtonType.outlined;
  bool get _isDisabled => onPressed == null;

  static const _defaultPadding =
      EdgeInsets.symmetric(horizontal: 15, vertical: 8);

  Color _calculateOverlayColor() {
    if (_isPrimary) {
      return AppColors.primaryText;
    }

    if (_isText && color == AppColors.black50) {
      return color.withAlpha(5);
    }

    return color.withAlpha(10);
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(
        overlayColor ?? _calculateOverlayColor(),
      ),
      padding: MaterialStateProperty.all(
        padding ?? _defaultPadding,
      ),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (_isPrimary || _isOutlined) {
            if (states.contains(MaterialState.disabled)) {
              return const BorderSide(
                color: AppColors.disabledColor,
              );
            }
          }

          return BorderSide(color: borderColor ?? backgroundColor);
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (_isPrimary || _isOutlined) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.disabledColor;
            }
          }

          return backgroundColor;
        },
      ),
      shape: isRounded
          ? MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            )
          : borderRadius != null
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius!,
                  ),
                )
              : MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: MaterialStateProperty.all(
        minimumSize ?? Size.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contentColor = _isDisabled ? AppColors.disabledColor : color;

    final child = _ButtonContent(
      contentColor: contentColor,
      content: content,
      prefix: prefix,
      suffix: suffix,
      prefixPadding: prefixPadding,
      suffixPadding: suffixPadding,
      alignment: alignment,
      expand: expand,
      type: _type,
    );

    if (_isLink || _isText || _isDisabled) {
      return TextButton(
        onPressed: onPressed,
        style: _getButtonStyle(),
        child: child,
      );
    }

    if (_isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: _getButtonStyle(),
        child: child,
      );
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(),
      child: child,
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.contentColor,
    required this.content,
    required this.type,
    this.prefix,
    this.suffix,
    this.prefixPadding,
    this.suffixPadding,
    this.alignment,
    this.expand = false,
  });

  final Color contentColor;
  final Widget content;
  final Widget? prefix;
  final Widget? suffix;
  final EdgeInsetsGeometry? prefixPadding;
  final EdgeInsetsGeometry? suffixPadding;
  final MainAxisAlignment? alignment;
  final bool expand;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: switch (type) {
        ButtonType.primary || ButtonType.outlined => TypographyMedium.lg(
            color: contentColor,
          ),
        ButtonType.text || ButtonType.link => TypographyLight.md(
            color: contentColor,
          ),
      },
      child: IconTheme(
        data: IconThemeData(size: 16, color: contentColor),
        child: DefaultSvgTheme(
          theme: SvgTheme(currentColor: contentColor),
          child: Row(
            mainAxisAlignment: alignment ?? MainAxisAlignment.center,
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            children: [
              if (prefix != null)
                Padding(
                  padding: prefixPadding ?? const EdgeInsets.only(right: 8),
                  child: prefix,
                ),
              Flexible(
                child: content,
              ),
              if (suffix != null)
                Padding(
                  padding: suffixPadding ?? const EdgeInsets.only(left: 8),
                  child: suffix,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
