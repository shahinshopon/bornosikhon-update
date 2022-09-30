import 'dart:async';
import 'package:borno_shikhon/ui/responsive/size_config.dart';
import 'package:borno_shikhon/ui/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  Future chooseScreen() async {
    var userId = box.read('seen');
   
    if (userId == true) {
      Get.toNamed(category);
    } else {
      Get.toNamed(onboarding);
    }
  }

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
      () {
        chooseScreen();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //get device height width
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        // child: Image.asset(
        //   "assets/logo/logo.png",
        //   width: 200.w ,
        // ),
        child: Text("Splash Screen"),
      ),
    );
  }
}
