import 'package:borno_shikhon/ui/responsive/size_config.dart';
import 'package:flutter/material.dart';

Widget categoryBox(Color color, ontap, String text) {
  return Container(
    decoration: BoxDecoration(color: color),
    child: Material(
        color: color,
        child: InkWell(
          onTap: ontap,
          splashColor: Colors.white,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.screenHeight! * 0.032,
              ),
            ),
          ),
        )),
    width: SizeConfig.screenWidth! / 2.03,
  );
}
