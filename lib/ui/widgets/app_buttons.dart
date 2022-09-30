
import 'package:borno_shikhon/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget fullWidthButton(
  String title,
  onPressed,
) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    ),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      color: AppColors.violetColor,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 11.h,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize:  15.sp ),
            ),
          ),
        ),
      ),
    ),
  );
}

