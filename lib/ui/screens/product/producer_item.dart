import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class ProducerItem extends StatelessWidget {
  const ProducerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 180.h,
      width: 160.w,
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.loose,
        children: [
          Positioned.fill(
            top: 50,
            child: Container(
              height: 140,
              width: 160,
              color: ColorManager.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: ColorManager.red,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Elasticated Wrist Support',
                      style: TextStyle(color: ColorManager.primary),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('60',
                            style: TextStyle(
                                fontFamily: FontConstants.fontFamily,
                                fontSize: 16,
                                color: ColorManager.red,
                                decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                            )),
                        Text(
                          '60',
                          style: getBoldStyle(color: ColorManager.green),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              radius: 40,
              child: Image.asset(
                ImageAssets.onboarding2,
                fit: BoxFit.fill,
              ),
            ),
            bottom: 90,
          )
        ],
      ),
    );
  }
}
