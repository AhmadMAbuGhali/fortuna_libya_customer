import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuna_libya_customer/navigator/router_class.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/screens/home_screens/home_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/limit_offer/limited_offer.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/point/point_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/profile/profile_screen.dart';
import '../screens/favourite/favourite_screen.dart';
class DrawarWidget extends StatelessWidget  {
    DrawarWidget({Key? key,required this.function}) : super(key: key);
    VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: ColorManager.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // arrow to close Drawer
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: function,
                    icon: SvgPicture.asset(
                      IconAssets.arrow,
                      height: 18.h,
                      width: 18.w,
                    )),
              ],
            ),
            //CircleAvatar
            CircleAvatar(
              radius: 50,
              child: Image.asset(ImageAssets.onboarding1),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'ليبيا الأمل',
              style: getBoldStyle(color: ColorManager.black, fontSize: 19),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'المبلغ المدين',
              style:
              getRegularStyle(color: ColorManager.black, fontSize: 19),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 60.h,
              width: 160.w,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [
                        Color(0xFF60CCE8),
                        Color(0xFF083844),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                    '5400',
                    style:
                    getBoldStyle(color: ColorManager.white, fontSize: 22),
                  )),
            ),
            SizedBox(
              height: 12.h,
            ),
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //home
                      GestureDetector(
                        onTap: () {
                          RouterClass.routerClass
                              .pushWidgetReplacement(HomeScreen());
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.home_filled,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              " الرئيسية",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //profile
                      GestureDetector(
                        onTap: () {
                          RouterClass.routerClass
                              .pushWidgetReplacement(ProfileScreen());
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              " الملف الشخصي",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //order
                      GestureDetector(
                        onTap: (){
                          RouterClass.routerClass.pushWidgetReplacement(OrderScreen());
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconAssets.order,
                              color: ColorManager.black,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              " الطلبات",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //limit
                      GestureDetector(
                        onTap: (){
                          RouterClass.routerClass.pushWidgetReplacement(LimitedOffer());
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconAssets.limit,
                              color: ColorManager.black,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "الكمية المحدودة",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //offer
                      GestureDetector(
                        onTap: (){
                          RouterClass.routerClass.pushWidgetReplacement(FavouriteScreen());
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconAssets.offer,
                              color: ColorManager.black,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              " العروض",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //notification
                      Row(
                        children: [
                          const Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            " الإشعارات",
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //favorite
                      GestureDetector(
                        onTap: (){
                          RouterClass.routerClass.pushWidgetReplacement(FavouriteScreen());

                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "المفضلة",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      // point
                      GestureDetector(
                        onTap: (){
                          RouterClass.routerClass.pushWidgetReplacement(PointScreen());
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              IconAssets.point,
                              color: ColorManager.black,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "  النقاط",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //language
                      Row(children: [
                        Expanded(
                          child: ExpansionTile(
                            leading: const Icon(
                              Icons.language,
                              color: Colors.black,
                            ),
                            title: Text(
                              'اللغة',
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ),
                            tilePadding: const EdgeInsets.all(-5),
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'عربي',
                                          style: getRegularStyle(
                                              color: ColorManager.black,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'English',
                                          style: getRegularStyle(
                                              color: ColorManager.black,
                                              fontSize: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //support
                      Row(
                        children: [
                          const Icon(
                            Icons.headset_mic_sharp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            " الدعم الفني",
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //logout
                      Row(
                        children: [
                          SvgPicture.asset(
                            IconAssets.logout,
                            color: ColorManager.black,
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            " تسجيل الخروج",
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
