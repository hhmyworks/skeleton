import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(31, 31, 31, 1),
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF211F1F),
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 14.h,
      height: 1.15,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF211F1F),
    ),
  );
  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.roboto(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.roboto(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w500,
      color: const Color.fromRGBO(255, 254, 252, 1),
    ),
    headline2: GoogleFonts.roboto(
      fontSize: 21.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.roboto(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 14.h,
      height: 1.15,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return const Color.fromARGB(255, 26, 107, 80);
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        foregroundColor: Color.fromRGBO(31, 31, 31, 1),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 26, 107, 80),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 97, 184, 175),
      ),
      textTheme: lightTextTheme,
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color.fromARGB(255, 97, 184, 175),
      ),
      textTheme: darkTextTheme,
    );
  }
}
