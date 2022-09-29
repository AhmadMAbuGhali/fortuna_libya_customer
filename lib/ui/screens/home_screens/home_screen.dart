import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';
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

        drawer: DrawarWidget(
            function: () => scaffoldKey.currentState?.closeDrawer()),
      ),
    );
  }
}
