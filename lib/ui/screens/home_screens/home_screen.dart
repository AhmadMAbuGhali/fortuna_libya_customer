import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/screens/favourite/favourite_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/limit_offer/limited_offer.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/product/product_details.dart';
import 'package:fortuna_libya_customer/ui/screens/profile/profile_screen.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/color_manager.dart';
import '../point/point_screen.dart';
import '../product/producer_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  TabController? tabController;
  List<Color>? tabBackground;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabBackground = [Colors.blue, Colors.pink, Colors.cyan];
    tabController?.addListener(() {
      if (tabController!.indexIsChanging) {
        setState(() {
          tabBackground![tabController!.index] = ColorManager.primary;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();

    super.dispose();
  }

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
            'الرئيسية',
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
            children: [
              //search
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  hintText: "إبحث عن منتح",
                ),
              ),
              //tab bar
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: <Widget>[
                        ButtonsTabBar(
                          buttonMargin: EdgeInsets.symmetric(horizontal: 10),
                          contentPadding: EdgeInsets.only(
                              top: 5, bottom: 10, left: 18, right: 18),
                          height: 40.h,
                          backgroundColor: ColorManager.primary,
                          unselectedBackgroundColor: Colors.white,
                          unselectedLabelStyle: TextStyle(color: Colors.black),
                          borderWidth: 1,
                          borderColor: ColorManager.primary,
                          labelStyle: getBoldStyle(
                              color: ColorManager.white, fontSize: 18),
                          tabs: const [
                            Tab(
                              text: "العروض",
                              height: 70,
                            ),
                            Tab(
                              text: "الجديد",
                            ),
                            Tab(
                              text: "المنتجات",
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        // width / height: fixed for *all* items
                                        childAspectRatio: 0.87,
                                      ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              RouterClass.routerClass
                                                  .pushWidgetReplacement(
                                                      ProductDetails());
                                            },
                                            child: ProducerItem());
                                      }),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        // width / height: fixed for *all* items
                                        childAspectRatio: 0.87,
                                      ),
                                      itemCount: 12,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                            onTap: () {
                                              RouterClass.routerClass
                                                  .pushWidgetReplacement(
                                                      ProductDetails());
                                            },
                                            child: ProducerItem());
                                      }),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        // width / height: fixed for *all* items
                                        childAspectRatio: 0.87,
                                      ),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          child: ProducerItem(),
                                          onTap: () {
                                            RouterClass.routerClass
                                                .pushWidgetReplacement(
                                                    ProductDetails());
                                          },
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
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
        ),
      ),
    );
  }
}
