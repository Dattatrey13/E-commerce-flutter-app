import 'package:flutter/material.dart';
import 'package:dapperz/utilities/color_utils.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color txt;
  Color primary;
  Color primaryLight;
  Color secondary;
  Color accentTxt;
  Color bg1;
  Color bgColor;
  Color surface;
  Color error;

  //Extra Colors
  Color bgGray;
  Color gray;
  Color darkGray;
  Color lightGray;
  Color borderGray;
  Color green;
  Color white;
  Color whiteColor;
  Color themeColor;
  Color blackColor;
  Color blackText;
  Color textColor;
  Color contentColor;
  Color borderColor;
  Color greenColor;
  Color darkContentColor;
  Color ratingColor;
  Color homeCategoryColor;
  Color greyLight25;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.txt,
    required this.primary,
    required this.primaryLight,
    required this.secondary,
    required this.accentTxt,
    required this.bg1,
    required this.bgColor,
    required this.surface,
    required this.error,
    //Extra
    required this.bgGray,
    required this.gray,
    required this.darkGray,
    required this.lightGray,
    required this.borderGray,
    required this.green,
    required this.white,
    required this.whiteColor,
    required this.themeColor,
    required this.blackColor,
    required this.blackText,
    required this.textColor,
    required this.contentColor,
    required this.borderColor,
    required this.greenColor,
    required this.darkContentColor,
    required this.ratingColor,
    required this.homeCategoryColor,
    required this.greyLight25,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,

          txt: const Color(0xFF001928),
          // primary: const Color(0xFFFF4C3B),

          primary: const Color(0xFF5D4037),
          primaryLight: const Color(0xFFFFF4F4),
          // secondary: const Color(0xFF6EBAE7),
          secondary: const Color(0xFFD7CCC8),
          accentTxt: const Color(0xFF001928),
          // accentTxt: Colors.white,
          // bg1: Colors.white,
          bg1: const Color(0xFFF5F5F5),
          bgColor: Colors.white,
          surface: Colors.white,
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFFF0F8FD),
          gray: const Color(0xFF999999),
          darkGray: const Color(0xFF666666),
          lightGray: const Color(0xFFEDEFF4),
          borderGray: const Color(0xFFE6E8EA),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          whiteColor: Colors.white,
          themeColor: const Color(0xFF222222),
          blackColor: Colors.black,
          // blackColor: Colors.black,
          contentColor: const Color(0xFF777777),
          borderColor: const Color(0xFFDDDDDD),
          greenColor: const Color(0xFF198754),
          darkContentColor: const Color(0xFFBABABA),
          // ratingColor: const Color(0xFFFFBA49),
          ratingColor: const Color(0xFF5D4037),
          // ratingColor: const Color(0xFFD2EF9A),
          homeCategoryColor: const Color(0xFFEAEDF2),
          textColor: const Color(0xFF3E2723),
          greyLight25: const Color(0xFFEDEFF4),
          blackText: Colors.black,
        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          txt: Colors.black,
          // primary: const Color(0xFFFDE613),
          primary: const Color(0xFF5D4037),
          // primary: const Color(0xFFD2EF9A),
          primaryLight: const Color(0xFF202020),
          secondary: const Color(0xFF6EBAE7),
          // secondary: const Color(0xFFD7CCC8),
          accentTxt: const Color(0xFF001928),
          // accentTxt: Colors.white,
          bg1: const Color(0xFF151A1E),
          bgColor: const Color(0xFF262626),
          surface: const Color(0xFF151A1E),
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFF262F36),
          gray: const Color(0xFF999999),
          darkGray: const Color(0xFF999999),
          lightGray: const Color(0xFF202020),
          borderGray: const Color(0xFF353C41),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          whiteColor: Colors.black,
          blackText: Colors.black,
          // blackText: const Color(0xFF262626),
          blackColor: Colors.white,
          contentColor: const Color(0xFF777777),
          borderColor: const Color(0xFFDDDDDD),
          greenColor: const Color(0xFF198754),
          darkContentColor: const Color(0xFFBABABA),
          // ratingColor: const Color(0xFFFFBA49),
          ratingColor: const Color(0xFF5D4037),
          // ratingColor: const Color(0xFFD2EF9A),
          textColor: const Color(0xFF636363),
          homeCategoryColor: const Color(0xFFEAEDF2),
          greyLight25: Colors.black,
          themeColor: const Color(0xFF5D4037),
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryContainer: shiftHsl(primary, -.2),
        secondary: secondary,
        secondaryContainer: shiftHsl(secondary, -.2),
        background: bg1,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
        surfaceTint: whiteColor,
      ),
    );
    return t.copyWith(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: borderGray,
          selectionHandleColor: Colors.transparent,
          cursorColor: primary,
        ),
        buttonTheme: ButtonThemeData(buttonColor: primary),
        highlightColor: primary,
        toggleButtonsTheme: ToggleButtonsThemeData(color: primary));
  }
}
