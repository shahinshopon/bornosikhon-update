
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  Divider transparentDivider = Divider(
    color: Colors.transparent,
  );
  Divider greyDivider = Divider(
    thickness: 1,
    color: Color(0xffcccccc),
  );
  static SizedBox verticalSizedBoxThree = SizedBox(
    height: 6.h,
  );
  static SizedBox verticalSizedBoxTen = SizedBox(
    height: 10.h,
  );

  static SizedBox verticalSizedBoxTwenty = SizedBox(
    height: 20.h,
  );
  static SizedBox verticalSizedBoxThirty = SizedBox(
    height: 30.h,
  );
  static SizedBox verticalSizedBoxFourty = SizedBox(
    height: 40.h,
  );
  static SizedBox horizontalSizedBoxTen = SizedBox(
    width: 10.h,
  );
  static SizedBox horizontalSizedBoxTwenty = SizedBox(
    width: 20.h,
  );

  static TextStyle headingOne = TextStyle(
    fontSize: 28.sp ,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingTwo = TextStyle(
    fontSize:  15.sp ,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headingThree = TextStyle(
    fontSize:  13.sp ,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headingFour = TextStyle(
    fontSize: 20.sp ,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headingFive = TextStyle(
    fontSize: 10.sp ,
    fontWeight: FontWeight.w600,
  );
  static TextStyle headingSix = TextStyle(
    fontSize: 10.sp ,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headingSeven = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingEight = TextStyle(
    fontSize: 10.sp ,
    fontWeight: FontWeight.bold,
  );

  progressDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/files/loading.gif",
            height: 150.h,
          ),
        );
      },
      barrierDismissible: false,
    );
  }
}
