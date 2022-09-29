import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../home_screens/home_screen.dart';
import '../profile/profile_screen.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({Key? key}) : super(key: key);

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
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
            'النقاط',
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 121.h,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.point,
                                color: ColorManager.white,
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                'رصيد النقاط ',
                                style: getBoldStyle(
                                    color: ColorManager.white, fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '257 ',
                                style: getBoldStyle(
                                    color: ColorManager.white, fontSize: 21),
                              ),
                              Text(
                                'نقطة ',
                                style: getBoldStyle(
                                    color: ColorManager.white, fontSize: 21),
                              )
                            ],
                          ),
                          Text(
                            'يتم تصفير النقاط في بداية كل شهر فردي ',
                            style: getBoldStyle(
                                color: ColorManager.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      IconAssets.cash,
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'يمكنك الإستفادة من النقاط بعد 243 نقطة إضافية',
                  style: getBoldStyle(color: ColorManager.red, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration:const BoxDecoration(
                  gradient:  LinearGradient(
                      colors: [
                        Color(0xFF127AB9),
                        Color(0xFF006FAE),
                        Color(0xFF066CAC),
                        Color(0xFF045BA0),
                        Color(0xFF08589D),

                      ],
                      begin: FractionalOffset(0.0, 0.0,),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0,0.2,0.4,0.6 ,1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Center(
                    child: Text(
                  'يتم احتساب نقطة لكل 100 دينار',
                  style: getBoldStyle(color: ColorManager.white, fontSize: 22),
                )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconAssets.point,
                      color: ColorManager.black,
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'سجل النقاط لكل عملية شراء',
                      style:
                          getBoldStyle(color: ColorManager.black, fontSize: 20),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(IconAssets.plus),
                      SizedBox(width: 16.w,),
                      Text('شراء طلبية بمبلغ 4500 ',style: getBoldStyle(color: ColorManager.black,fontSize: 16),),
                      Spacer(),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('+45',style: getBoldStyle(color: ColorManager.green,fontSize: 16),),
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
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
                      Row(
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
                      SizedBox(
                        height: 12.h,
                      ),
                      //limit
                      Row(
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
                      SizedBox(
                        height: 12.h,
                      ),
                      //offer
                      Row(
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
                      Row(
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
                      SizedBox(
                        height: 12.h,
                      ),
                      // point
                      Row(
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
        ),
      ),
    );
  }
}
