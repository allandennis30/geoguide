import 'package:flutter/widgets.dart';
import 'package:geoguide/ui/shared/theme/app_colors.dart';

const _xsSize = 12.0;
const _smSize = 14.0;
const _mdSize = 16.0;
const _lgSize = 18.0;
const _xlSize = 24.0;

const _titleColor = AppColors.black50;
const _bodyColor = AppColors.grey600;
const _captionColor = AppColors.grey300;

class TypographyLight extends TextStyle {
  const TypographyLight._({
    super.fontSize,
    super.fontStyle,
    super.color,
    super.fontFamily,
  }) : super(
          fontWeight: FontWeight.w300,
        );

  /// FontSize: 12
  const TypographyLight.xs({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xsSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 14
  const TypographyLight.sm({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _smSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 16
  const TypographyLight.md({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _mdSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 18
  const TypographyLight.lg({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _lgSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 24
  const TypographyLight.xl({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xlSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 12, Color: Black50
  static TextStyle get xsTitle => const TypographyLight._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 14, Color: Black50
  static TextStyle get smTitle => const TypographyLight._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 16, Color: Black50
  static TextStyle get mdTitle => const TypographyLight._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 18, Color: Black50
  static TextStyle get lgTitle => const TypographyLight._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 24, Color: Black50
  static TextStyle get xlTitle => const TypographyLight._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 12, Color: Grey600
  static TextStyle get xsBody => const TypographyLight._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 14, Color: Grey600
  static TextStyle get smBody => const TypographyLight._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 16, Color: Grey600
  static TextStyle get mdBody => const TypographyLight._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 18, Color: Grey600
  static TextStyle get lgBody => const TypographyLight._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 24, Color: Grey600
  static TextStyle get xlBody => const TypographyLight._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 12, Color: Grey300
  static TextStyle get xsCaption => const TypographyLight._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 14, Color: Grey300
  static TextStyle get smCaption => const TypographyLight._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 16, Color: Grey300
  static TextStyle get mdCaption => const TypographyLight._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 18, Color: Grey300
  static TextStyle get lgCaption => const TypographyLight._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );
}

class TypographyReg extends TextStyle {
  const TypographyReg._({
    super.fontSize,
    super.fontStyle,
    super.color,
    super.fontFamily,
  }) : super(
          fontWeight: FontWeight.w400,
        );

  /// FontSize: 12
  const TypographyReg.xs({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xsSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 14
  const TypographyReg.sm({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _smSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 16
  const TypographyReg.md({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _mdSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 18
  const TypographyReg.lg({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _lgSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 24
  const TypographyReg.xl({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xlSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 12, Color: Black50
  static TextStyle get xsTitle => const TypographyReg._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 14, Color: Black50
  static TextStyle get smTitle => const TypographyReg._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 16, Color: Black50
  static TextStyle get mdTitle => const TypographyReg._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 18, Color: Black50
  static TextStyle get lgTitle => const TypographyReg._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 24, Color: Black50
  static TextStyle get xlTitle => const TypographyReg._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 12, Color: Grey600
  static TextStyle get xsBody => const TypographyReg._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 14, Color: Grey600
  static TextStyle get smBody => const TypographyReg._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 16, Color: Grey600
  static TextStyle get mdBody => const TypographyReg._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 18, Color: Grey600
  static TextStyle get lgBody => const TypographyReg._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 24, Color: Grey600
  static TextStyle get xlBody => const TypographyReg._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 12, Color: Grey300
  static TextStyle get xsCaption => const TypographyReg._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 14, Color: Grey300
  static TextStyle get smCaption => const TypographyReg._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 16, Color: Grey300
  static TextStyle get mdCaption => const TypographyReg._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 18, Color: Grey300
  static TextStyle get lgCaption => const TypographyReg._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 24, Color: Grey300
  static TextStyle get xlCaption => const TypographyReg._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );
}

class TypographyMedium extends TextStyle {
  const TypographyMedium._({
    super.fontSize,
    super.fontStyle,
    super.color,
    super.fontFamily,
  }) : super(
          fontWeight: FontWeight.w500,
        );

  /// FontSize: 12
  const TypographyMedium.xs({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xsSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 14
  const TypographyMedium.sm({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _smSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 16
  const TypographyMedium.md({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _mdSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 18
  const TypographyMedium.lg({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _lgSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 24
  const TypographyMedium.xl({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xlSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 12, Color: Black50
  static TextStyle get xsTitle => const TypographyMedium._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 14, Color: Black50
  static TextStyle get smTitle => const TypographyMedium._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 16, Color: Black50
  static TextStyle get mdTitle => const TypographyMedium._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 18, Color: Black50
  static TextStyle get lgTitle => const TypographyMedium._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 24, Color: Black50
  static TextStyle get xlTitle => const TypographyMedium._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 12, Color: Grey600
  static TextStyle get xsBody => const TypographyMedium._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 14, Color: Grey600
  static TextStyle get smBody => const TypographyMedium._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 16, Color: Grey600
  static TextStyle get mdBody => const TypographyMedium._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 18, Color: Grey600
  static TextStyle get lgBody => const TypographyMedium._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 24, Color: Grey600
  static TextStyle get xlBody => const TypographyMedium._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 12, Color: Grey300
  static TextStyle get xsCaption => const TypographyMedium._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 14, Color: Grey300
  static TextStyle get smCaption => const TypographyMedium._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 16, Color: Grey300
  static TextStyle get mdCaption => const TypographyMedium._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 18, Color: Grey300
  static TextStyle get lgCaption => const TypographyMedium._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 24, Color: Grey300
  static TextStyle get xlCaption => const TypographyMedium._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );
}

class TypographyBold extends TextStyle {
  const TypographyBold._({
    super.fontSize,
    super.fontStyle,
    super.color,
    super.fontFamily,
  }) : super(
          fontWeight: FontWeight.bold,
        );

  /// FontSize: 12
  const TypographyBold.xs({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xsSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 14
  const TypographyBold.sm({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _smSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 16
  const TypographyBold.md({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _mdSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 18
  const TypographyBold.lg({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _lgSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 24
  const TypographyBold.xl({
    super.color,
    super.fontFamily,
  }) : super(
          fontSize: _xlSize,
          fontStyle: FontStyle.normal,
        );

  /// FontSize: 12, Color: Black50
  static TextStyle get xsTitle => const TypographyBold._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 14, Color: Black50
  static TextStyle get smTitle => const TypographyBold._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 16, Color: Black50
  static TextStyle get mdTitle => const TypographyBold._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 18, Color: Black50
  static TextStyle get lgTitle => const TypographyBold._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 24, Color: Black50
  static TextStyle get xlTitle => const TypographyBold._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _titleColor,
      );

  /// FontSize: 12, Color: Grey600
  static TextStyle get xsBody => const TypographyBold._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 14, Color: Grey600
  static TextStyle get smBody => const TypographyBold._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 16, Color: Grey600
  static TextStyle get mdBody => const TypographyBold._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 18, Color: Grey600
  static TextStyle get lgBody => const TypographyBold._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 24, Color: Grey600
  static TextStyle get xlBody => const TypographyBold._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _bodyColor,
      );

  /// FontSize: 12, Color: Grey300
  static TextStyle get xsCaption => const TypographyBold._(
        fontSize: _xsSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 14, Color: Grey300
  static TextStyle get smCaption => const TypographyBold._(
        fontSize: _smSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 16, Color: Grey300
  static TextStyle get mdCaption => const TypographyBold._(
        fontSize: _mdSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 18, Color: Grey300
  static TextStyle get lgCaption => const TypographyBold._(
        fontSize: _lgSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );

  /// FontSize: 24, Color: Grey300
  static TextStyle get xlCaption => const TypographyBold._(
        fontSize: _xlSize,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: _captionColor,
      );
}

class TypographyCustom extends TextStyle {
  const TypographyCustom._({
    super.fontSize,
    super.fontStyle,
    super.color,
    super.fontFamily,
    super.fontWeight,
  });

  static TextStyle get logo => const TypographyCustom._(
        fontSize: 50,
        color: AppColors.primary,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      );
}
