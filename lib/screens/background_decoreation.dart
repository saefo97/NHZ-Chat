import 'dart:math';
import 'package:flutter/material.dart';
import '../constant.dart';

class BackGroundDecoration extends StatelessWidget {
  const BackGroundDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: phoneWidth,
      height: phoneHeight,
      child: Stack(

        children: [
          Positioned(
            right: 0.0,
            child: Container(
              height:min(phoneWidth* 2/3,phoneHeight * 2/3) ,
              width: min(phoneWidth* 2/3, phoneHeight * 2/3),
              decoration: BoxDecoration(
                  gradient: kLightGradiant,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 4.0,
                      blurRadius: 3.0,

                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(360.0),
                  )
              ),
            ),
          ),
          Container(
            height: min(phoneWidth * 3/4 , phoneHeight* 3/4) ,
            width: min(phoneWidth * 3/4 , phoneHeight* 3/4) ,
            decoration: BoxDecoration(
                gradient: kDarkGradiant,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 5.0,
                    blurRadius: 4.0,

                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(360.0),
                )
            ),
          ),
          Positioned(
            right: 50.0,
            bottom: 100.0,
            child: Container(
              height: 75.0,
              width: 75.0 ,
              decoration: BoxDecoration(
                  gradient:kDarkGradiant,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(4, 4),
                      blurRadius: 2.0,

                    ),
                  ],
                  borderRadius: BorderRadius.circular(360.0)
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            bottom: 200.0,
            child: Container(
              height: 30.0 ,
              width: 30.0 ,
              decoration: BoxDecoration(
                  gradient: kLightGradiant,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(5, 5),
                      blurRadius: 3.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(360.0)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
