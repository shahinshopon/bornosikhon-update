import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 22.w,
          ),
        ),
        colorScheme: const ColorScheme.light(),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(),
        ),
        scaffoldBackgroundColor: Color(0xFFFBFBFB),
      );

  ThemeData darkTheme(context) => ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 22.w,
          ),
          centerTitle: true,
        ),
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.actorTextTheme(
          Theme.of(context).textTheme.apply(),
        ),
        scaffoldBackgroundColor: Colors.black38,
      );
}
