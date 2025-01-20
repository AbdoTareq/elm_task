import 'package:elm_task/core/text_theme.dart';
import 'package:elm_task/export.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: kLight,
  textTheme: lightTextTheme,
  fontFamily: GoogleFonts.alexandria().fontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: kLight,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll<Color>(kLight),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      side: const WidgetStatePropertyAll<BorderSide>(
        BorderSide(color: kDarkBlue),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: kTextGreyColor,
          fontSize: 19,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  ),
);

final darkTheme = ThemeData(
  primaryColor: kPrimaryColor,
  brightness: Brightness.dark,
  textTheme: darkTextTheme,
  fontFamily: GoogleFonts.alexandria().fontFamily,
  scaffoldBackgroundColor: kDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: kDark,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll<Color>(kDark),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      side: const WidgetStatePropertyAll<BorderSide>(
        BorderSide(color: kPurple),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          color: kWhite,
          fontSize: 19,
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  ),
);
