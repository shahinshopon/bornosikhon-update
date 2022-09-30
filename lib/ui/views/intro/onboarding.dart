import 'package:borno_shikhon/const/app_strings.dart';
import 'package:borno_shikhon/ui/route/route.dart';
import 'package:borno_shikhon/ui/styles/styles.dart';
import 'package:borno_shikhon/ui/widgets/app_buttons.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  List<String> _lottieFiles = [
    'assets/files/welcome.json',
    'assets/files/categories.json',
    'assets/files/support.json',
  ];
  List<String> _title = [
    'স্বাগতম',
    'ক্যাটেগরি',
    'সমর্থন',
  ];
  List<String> _description = [
    'এপ্লিকেশনটি ডাউনলোড করার জন্যে আপনাকে অসংখ্য ধন্যবাদ।',
    'এখানে স্বরবর্ণ,ব্যঞ্জনবর্ণ,কার চিহ্ন,গাণিতিক সংখ্যা ও চিহ্ন,ইংরেজী অক্ষর ও সংখ্যা, সহ আরও অনেক ধরনের ক্যাটাগরি রয়েছে।',
    'যেকোন সমস্যার সম্মুখীন হলে আমাদের সাথে যোগাযোগ করুন।',
  ];
  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Obx(
                    () => Lottie.asset(_lottieFiles[_currentIndex.toInt()]),
                  )),
              Obx(
                () => DotsIndicator(
                  dotsCount: _lottieFiles.length,
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              AppStyles.verticalSizedBoxTwenty,
              Obx(
                () => Text(
                  '${_title[_currentIndex.toInt()]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AppStyles.verticalSizedBoxTwenty,
              Text('${_description[_currentIndex.toInt()]}'),
              AppStyles.verticalSizedBoxTwenty,
              fullWidthButton(AppStrings.next, () {
                if (_currentIndex == _title.length - 1) {
                  
                  final box = GetStorage();
                  box.write('seen', true);
                  Get.toNamed(category);
                } else {
                  _currentIndex + 1;
                }
              }),
              AppStyles.verticalSizedBoxTwenty,
            ],
          ),
        ),
      ),
    );
  }
}
