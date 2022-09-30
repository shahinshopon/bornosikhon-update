import 'package:borno_shikhon/const/app_colors.dart';
import 'package:borno_shikhon/const/app_strings.dart';
import 'package:borno_shikhon/ui/responsive/size_config.dart';
import 'package:borno_shikhon/ui/route/route.dart';
import 'package:borno_shikhon/ui/styles/styles.dart';
import 'package:borno_shikhon/ui/views/home/homepage.dart';
import 'package:borno_shikhon/ui/widgets/category_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: AppColors.violetColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.violetColor,
        elevation: 0,
        title: Text(
          AppStrings.appName,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(home,arguments: HomeScreen("Shorborno",AppColors.violetColor));
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.violetColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              30,
                            ),
                            bottomRight: Radius.circular(30))),
                    child: Center(
                      child: Text(
                        "স্বরবর্ণ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenHeight! * 0.05,
                        ),
                      ),
                    ),
                  ),
                )),
                AppStyles.verticalSizedBoxTen,
                
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  categoryBox(Color.fromARGB(255, 214, 193, 166), () {
                    Get.toNamed(home,arguments: HomeScreen("Benjonborno",Color.fromARGB(255, 214, 193, 166)));
                  }, "ব্যঞ্জনবর্ণ"),
                  categoryBox(Color(0xffFFA022), () {
                    Get.toNamed(home,arguments: HomeScreen("Karchinho",Color(0xffFFA022)));
                  }, "কার চিহ্ন"),
                ],
              ),
            ),
            AppStyles.verticalSizedBoxTen,
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  categoryBox(Color(0xffFF4C3D), () {
                    Get.toNamed(home,arguments: HomeScreen("GanitikShonkha",Color(0xffFF4C3D)));
                  }, "গাণিতিক সংখ্যা"),
                  categoryBox(Color(0xff78C7A6), () {
                    Get.toNamed(home,arguments: HomeScreen("GanitikChinho",Color(0xff78C7A6)));
                  }, "গাণিতিক চিহ্ন"),
                ],
              ),
            ),
            AppStyles.verticalSizedBoxTen,
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  categoryBox(Color(0xff84C4E7), () {
                    Get.toNamed(home,arguments: HomeScreen("EnglishLetter",Color(0xff84C4E7)));
                  }, "ইংরেজী অক্ষর"),
                  categoryBox(Color(0xff0A6A92), () {
                    Get.toNamed(home,arguments: HomeScreen("EnglishNumber",Color(0xff0A6A92)));
                  }, "ইংরেজী সংখ্যা"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
