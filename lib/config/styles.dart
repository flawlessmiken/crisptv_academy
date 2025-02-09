import 'package:cripstv_academy/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class TextStyles {
  late TextStyle textBodySmall;
  late TextStyle textBodyMedium;
  late TextStyle textBodyLarge;
  late TextStyle textBodyExtraLarge;
  late TextStyle textSubtitleSmall;
  late TextStyle textSubtitleMedium;
  late TextStyle textSubtitleLarge;
  late TextStyle textSubtitleExtraLarge;
  late TextStyle textTitleSmall;
  late TextStyle textTitleMedium;
  late TextStyle textTitleLarge;
  late TextStyle textTitleExtraLarge;

  late TextStyle displayBodyExtraSmall;
  late TextStyle displayBodySmall;
  late TextStyle displayBodyMedium;
  late TextStyle displayBodyLarge;
  late TextStyle displayBodyExtraLarge;
  late TextStyle displaySubtitleExtraSmall;
  late TextStyle displaySubtitleSmall;
  late TextStyle displaySubtitleMedium;
  late TextStyle displaySubtitleLarge;
  late TextStyle displaySubtitleExtraLarge;
  late TextStyle displayTitleExtraSmall;
  late TextStyle displayTitleSmall;
  late TextStyle displayTitleMedium;
  late TextStyle displayTitleLarge;
  late TextStyle displayTitleExtraLarge;

  final Color? color;
  final String fontFamily;
  final double letterSpacing;
  final double lineHeight;

  TextStyles({
    required this.color,
    this.fontFamily = 'DMSans',
    this.letterSpacing = 0.2,
    this.lineHeight = 1.3,
  }) {
    textBodySmall = style(fontSize: 10.0, fontWeight: FontWeight.w400);
    textBodyMedium = style(fontSize: 12.0, fontWeight: FontWeight.w400);
    textBodyLarge = style(fontSize: 14.0, fontWeight: FontWeight.w400);
    textBodyExtraLarge = style(fontSize: 16.0, fontWeight: FontWeight.w400);

    textSubtitleSmall = style(fontSize: 10.0, fontWeight: FontWeight.w600);
    textSubtitleMedium = style(fontSize: 12.0, fontWeight: FontWeight.w600);
    textSubtitleLarge = style(fontSize: 14.0, fontWeight: FontWeight.w600);
    textSubtitleExtraLarge = style(fontSize: 16.0, fontWeight: FontWeight.w600);

    textTitleSmall = style(fontSize: 10.0, fontWeight: FontWeight.w700);
    textTitleMedium = style(fontSize: 12.0, fontWeight: FontWeight.w700);
    textTitleLarge = style(fontSize: 14.0, fontWeight: FontWeight.w700);
    textTitleExtraLarge = style(fontSize: 16.0, fontWeight: FontWeight.w700);

    displayBodyExtraSmall = style(fontSize: 18.0, fontWeight: FontWeight.w400);
    displayBodySmall = style(fontSize: 20.0, fontWeight: FontWeight.w400);
    displayBodyMedium = style(fontSize: 23.0, fontWeight: FontWeight.w400);
    displayBodyLarge = style(fontSize: 26.0, fontWeight: FontWeight.w400);
    displayBodyExtraLarge = style(fontSize: 30.0, fontWeight: FontWeight.w400);

    displaySubtitleExtraSmall =
        style(fontSize: 18.0, fontWeight: FontWeight.w600);
    displaySubtitleSmall = style(fontSize: 20.0, fontWeight: FontWeight.w600);
    displaySubtitleMedium = style(fontSize: 23.0, fontWeight: FontWeight.w600);
    displaySubtitleLarge = style(fontSize: 26.0, fontWeight: FontWeight.w600);
    displaySubtitleExtraLarge =
        style(fontSize: 30.0, fontWeight: FontWeight.w600);

    displayTitleExtraSmall = style(fontSize: 18.0, fontWeight: FontWeight.w700);
    displayTitleSmall = style(fontSize: 20.0, fontWeight: FontWeight.w700);
    displayTitleMedium = style(fontSize: 23.0, fontWeight: FontWeight.w700);
    displayTitleLarge = style(fontSize: 26.0, fontWeight: FontWeight.w700);
    displayTitleExtraLarge = style(fontSize: 30.0, fontWeight: FontWeight.w700);
  }
  TextStyle style({required double fontSize, required FontWeight fontWeight}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpacing,
        color: color);
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20, color: CustomColors.grey, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: CustomColors.grey[2]!),
    borderRadius: BorderRadius.circular(8),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: CustomColors.primary),
);

final submittedPinTheme = defaultPinTheme.copyWith(
    textStyle: const TextStyle(
        fontSize: 20, color: CustomColors.white, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: CustomColors.primary),
      borderRadius: BorderRadius.circular(8),
      color: CustomColors.primary,
    ));

ThemeData timePickerTheme() {
  return ThemeData.light().copyWith(
    primaryColor: CustomColors.primary,
    highlightColor: CustomColors.primary,
    colorScheme: const ColorScheme.light(
      primary: CustomColors.primary,
    ),
    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
  );
}

ThemeData datePickerTheme() {
  return ThemeData(
    primarySwatch: Colors.grey,
    splashColor: const Color.fromRGBO(0, 0, 0, 1),
    highlightColor: Colors.black,
    colorScheme: const ColorScheme.light(
      primary: CustomColors.primary,
      onSecondary: Colors.black,
      onPrimary: Colors.white,
      // surface: Colors.black,
      // onSurface: Colors.black,
      // secondary: Colors.black,
    ),
    dialogBackgroundColor: Colors.white,
  );
}
