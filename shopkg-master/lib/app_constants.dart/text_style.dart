import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopkg/app_constants.dart/app_colors.dart';

class AppTextStyles {

 
  static TextStyle mulishHintText10w400 = GoogleFonts.mulish(
    fontSize: 16.0,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );
  static TextStyle mulishRegisterColor16w600 = GoogleFonts.mulish(
    fontSize: 40.0,
    color: AppColors.loginColor,
    fontWeight: FontWeight.w600,
  );
    static TextStyle mulishLoginColor16w600 = GoogleFonts.mulish(
    fontSize: 40.0,
    color: AppColors.registerColor,
    fontWeight: FontWeight.w600,
  );
    static TextStyle mulishloginColor8w300 = GoogleFonts.mulish(
    fontSize: 14.0,
    color: Color.fromARGB(255, 9, 29, 244),
    fontWeight: FontWeight.w300,
  );
   static TextStyle homepageTextStyle = GoogleFonts.mulish(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 17.0,
  );
   static TextStyle welcomeTextStyle = GoogleFonts.mulish(
    color: Color.fromARGB(255, 9, 203, 48),
   // fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );
    static TextStyle homepageTextStyleclother = GoogleFonts.mulish(
    color: Color.fromARGB(255, 160, 135, 241),
    //fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );
      static TextStyle homepageTextStyleDrawer = GoogleFonts.mulish(
    color: Colors.black,
    //backgroundColor: AppColors.drawePinkColor,
    //fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );
// static TextStyle mulishBlackk14w600 = GoogleFonts.mulish(
//     fontSize: 16.0,
//     color: AppColors.black,
//     fontWeight: FontWeight.w600,
//   );
}