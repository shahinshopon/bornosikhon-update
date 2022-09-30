import 'package:borno_shikhon/const/app_colors.dart';
import 'package:borno_shikhon/ui/responsive/size_config.dart';
import 'package:borno_shikhon/ui/route/route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.passName,this.passDesc,this.passImage);
  var passName;
  var passDesc;
  var passImage;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  FlutterTts flutterTts = FlutterTts();

  double rate = 0.5;

  bool isPlaying = false;

  Future _speak(String text) async {
    await flutterTts.setLanguage("bn-BD");
    await flutterTts.setPitch(1.0);
    //await flutterTts.setVoice("bn-BD-x-sfg#male_1-local");
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setVolume(1.0);
    if (text != null && text.isNotEmpty) {
      var result = await flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child: Center(
                        child: Text(
                      widget.passName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenHeight! * 0.15),
                    )),
                  ),
                ),
              ),
               Expanded(
                  flex: 1,
                  child: Card(
                    child: Container(
                      width: SizeConfig.screenWidth,
                      child: Center(
                        child: Text(
                          widget.passDesc,
                          style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.screenHeight! * 0.065),
                        ),
                      ),
                    ),
                  ),
                ),
              Text(
                "ছবি লোড করতে ইন্টারনেট অন করুন",
                style: TextStyle(color: Colors.green),
              ),
               Expanded(
                flex: 2,
                child: Card(
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child:Image.network(widget.passImage),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: SizeConfig.screenHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.violetColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(
                                      SizeConfig.screenHeight! * 0.05))),
                          height: SizeConfig.screenHeight! * 0.1,
                          width: SizeConfig.screenWidth! / 2.2,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                  size: SizeConfig.screenHeight! * 0.03,
                                ),
                                SizedBox(
                                  width: SizeConfig.screenHeight! * 0.01,
                                ),
                                Text(
                                  'শুনুন',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          SizeConfig.screenHeight! * 0.03),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                               _speak(widget.passDesc);
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(drawingboard);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.violetColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      SizeConfig.screenHeight! * 0.05))),
                          height: SizeConfig.screenHeight! * 0.1,
                          width: SizeConfig.screenWidth! / 2.2,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.create,
                                  color: Colors.white,
                                  size: SizeConfig.screenHeight! * 0.03,
                                ),
                                SizedBox(
                                  width: SizeConfig.screenHeight! * 0.01,
                                ),
                                Text(
                                  'লিখুন',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          SizeConfig.screenHeight! * 0.03),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



  // Widget GetImage(BuildContext context) {
  //   return Container(
  //     child: new StreamBuilder(
  //         stream: FirebaseFirestore.instance
  //             .collection('shorborno')
  //             .doc(widget.index.toString())
  //             .snapshots(),
  //         builder: (context, snapshot) {
  //           if (!snapshot.hasData) {
  //             return Center(
  //               child: CircularProgressIndicator(
  //                 backgroundColor: ColorData.progresscolor,
  //               ),
  //             );
  //           }

  //           var userDocument = snapshot.data;
  //           return Container(
  //             height: 100,
  //             width: 200,
  //             child: userDocument == null
  //                 ? Text("ছবি লোড হচ্ছে ...")
  //                 : Image.network(
  //                     userDocument["img"],
  //                     fit: BoxFit.fill,
  //                   ),
  //           );
  //         }),
  //   );
  // }

