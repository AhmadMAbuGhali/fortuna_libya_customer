import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';

import '../../navigator/router_class.dart';
import '../../resources/assets_manager.dart';
import '../screens/favourite/favourite_screen.dart';
import '../screens/home_screens/home_screen.dart';
import '../screens/limit_offer/limited_offer.dart';
import '../screens/order/order_screen.dart';
import '../screens/point/point_screen.dart';
import '../screens/profile/profile_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.backGround,
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
            icon: Icon(
              Icons.menu,
              color: ColorManager.black,
            )),
        title: Text(
          'الدعم الفني ',
          style: getBoldStyle(color: ColorManager.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconAssets.cart),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
Image.asset(ImageAssets.logo,height: 120,width: 120,),
          SizedBox(height: 20.h,),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '''في فورتينا نهتمّ بخدمتكم والتواصل معكم ، ونؤمن بأن طريقنا لنيل رضا زبائننا يتمثّل في تقديم خدمات دعم فني تلائم توقعاتهم، لذلك أعددنا في مدى كادراً فنيّاً مدرباً ومؤهلاً ليتمكن من خدمة زبائننا بالشكل الأمثل.

يعمل كادرنا على مدار الساعة طوال أيام الأسبوع لخدمتكم ضمن أعلى المعايير. لذلك وفي حال احتجتم لأية مساعدة أو واجهتم أية مشكلة فنية أو في حال كانت لديكم أية استفسارات، نرجو أن لا تتردّدوا بالاتصال على الرقم 0000000000 من أي هاتف أرضي أو محمول، أو الاتصال على الرقم 000000000 وسيتلقى كادرنا الفني مكالماتكم بكل سرور. ''',
              textAlign: TextAlign.start,
              style: getBoldStyle(color: ColorManager.black),
            ),
          ),
          SizedBox(height: 80.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor:Color(0xFFE8E8E8) ,
                child: SvgPicture.asset(IconAssets.call),
              ),
              SizedBox(width: 20.w,),
              CircleAvatar(
                radius: 30,
                backgroundColor:Color(0xFFE8E8E8) ,
                child: SvgPicture.asset(IconAssets.msg),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
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
                      onPressed: () {
                        if (scaffoldKey.currentState!.isDrawerOpen) {
                          scaffoldKey.currentState!.closeDrawer();
                          //close drawer, if drawer is open
                        }
                      },
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
                style: getRegularStyle(color: ColorManager.black, fontSize: 19),
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
                  style: getBoldStyle(color: ColorManager.white, fontSize: 22),
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
                      onTap: () {
                        RouterClass.routerClass
                            .pushWidgetReplacement(OrderScreen());
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
                      onTap: () {
                        RouterClass.routerClass
                            .pushWidgetReplacement(LimitedOffer());
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
                      onTap: () {
                        RouterClass.routerClass
                            .pushWidgetReplacement(FavouriteScreen());
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
                      onTap: () {
                        RouterClass.routerClass
                            .pushWidgetReplacement(FavouriteScreen());
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
                      onTap: () {
                        RouterClass.routerClass
                            .pushWidgetReplacement(PointScreen());
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
                    GestureDetector(
                      onTap: () {
                        RouterClass.routerClass
                            .pushWidgetReplacement(SupportScreen());
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
                            " الدعم الفني",
                            style: getBoldStyle(
                                color: ColorManager.black, fontSize: 18),
                          ),
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
      ),
    ));
  }
}
