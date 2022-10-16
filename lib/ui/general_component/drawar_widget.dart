import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuna_libya_customer/navigator/router_class.dart';
import 'package:fortuna_libya_customer/navigator/routes_const.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';

class DrawarWidget extends StatelessWidget  {
    const DrawarWidget({Key? key,required this.function}) : super(key: key);
  final  VoidCallback function;
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
              'deservedAmount',
              style:
              getRegularStyle(color: ColorManager.black, fontSize: 19),
            ).tr(),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 60.h,
              width: 160.w,
              decoration:const BoxDecoration(
                gradient:  LinearGradient(
                    colors: [
                      Color(0xFF127AB9),
                      Color(0xFF006FAE),
                      Color(0xFF066CAC),
                      Color(0xFF08589D),
                      Color(0xFF045BA0),
                    ],
                    begin: FractionalOffset(0.0, 0.0,),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0,0.2,0.4,0.6 ,1.0],
                    tileMode: TileMode.clamp),
              ),
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
                          function();
                          RouterClass.routerClass
                              .navigateToAndRemove(NavegatorConstant.homeApp);
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
                              "home",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //profile
                      GestureDetector(
                        onTap: () {
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.profile);

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
                              "profile",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //order
                      GestureDetector(
                        onTap: (){
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.order);

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
                              "order",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //limit
                      GestureDetector(
                        onTap: (){
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.limitedOffer);

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
                              "limitedProduct",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //offer
                      // GestureDetector(
                      //   onTap: (){
                      //     RouterClass.routerClass
                      //         .navigateTo(NavegatorConstant.favourite);
                      //
                      //   },
                      //   child: Row(
                      //     children: [
                      //       SvgPicture.asset(
                      //         IconAssets.offer,
                      //         color: ColorManager.black,
                      //         height: 20.h,
                      //         width: 20.w,
                      //       ),
                      //       SizedBox(
                      //         width: 30.w,
                      //       ),
                      //       Text(
                      //         " العروض",
                      //         style: getBoldStyle(
                      //             color: ColorManager.black, fontSize: 18),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 12.h,
                      // ),
                      //notification
                      GestureDetector(
                        onTap: (){
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.notificationScreen);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "notifications",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      //favorite
                      GestureDetector(
                        onTap: (){
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.favourite);


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
                              "Fav",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      // point
                      GestureDetector(
                        onTap: (){
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.point);
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
                              "points",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
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
                              'Lang',
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
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
                      GestureDetector(
                        onTap: (){
                          function();
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.support);

                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.headset_mic_sharp,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "support",
                              style: getBoldStyle(
                                  color: ColorManager.black, fontSize: 18),
                            ).tr(),
                          ],
                        ),
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
                            "logout",
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 18),
                          ).tr(),
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
