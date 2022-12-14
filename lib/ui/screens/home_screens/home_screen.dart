import 'dart:io';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/font_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';
import 'package:fortuna_libya_customer/ui/screens/product/product%20item_2.dart';
import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/color_manager.dart';
import '../../general_component/appbar_custom_widget.dart';

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
    final GlobalKey<ScaffoldState> scaffoldKeyHome = GlobalKey<ScaffoldState>();
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKeyHome,
          resizeToAvoidBottomInset: false,
          appBar: AppBarWidget(
            function: () {
              scaffoldKeyHome.currentState?.openDrawer();
            }, title: 'home'.tr(),
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
                    hintText: "searchProduct".tr(),
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
                            buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
                            contentPadding: const EdgeInsets.only(
                                top: 5, bottom: 10, left: 18, right: 18),
                            height: 40.h,
                            backgroundColor: ColorManager.primary,
                            unselectedBackgroundColor: Colors.white,
                            unselectedLabelStyle: const TextStyle(color: Colors.black),
                            borderWidth: 1,
                            borderColor: ColorManager.primary,
                            labelStyle: getBoldStyle(
                                color: ColorManager.white, fontSize: 18),
                            tabs:  [
                              Tab(
                                text: "product".tr(),
                                height: 70,
                              ),
                              Tab(
                                text: "new".tr(),
                              ),
                              Tab(
                                text: "offer".tr(),
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
                                          // childAspectRatio: 0.87,
                                              mainAxisExtent: 180.h,
                                        ),
                                        itemCount: 12,
                                        itemBuilder: (context, index) {
                                          return  const ProductHomeWidget();
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
                                          // childAspectRatio: 0.87,
                                          mainAxisExtent: 180.h,
                                        ),
                                        itemCount: 12,
                                        itemBuilder: (context, index) {
                                          return  const ProductHomeWidget();
                                        }),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        const Text('???????? ?????? ???????????? ????????????  1 ?????? ?? 12 ???????? ?? 8 ??????????'),
                                        SizedBox(height: 8.h,),
                                        Expanded(
                                          child: GridView.builder(
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10,
                                                // width / height: fixed for *all* items
                                                // childAspectRatio: 0.87,
                                                mainAxisExtent: 180.h,
                                              ),
                                              itemCount: 12,
                                              itemBuilder: (context, index) {
                                                return  const ProductHomeWidget();
                                              }),
                                        ),
                                      ],
                                    ),
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
              function: () => scaffoldKeyHome.currentState?.closeDrawer()),
        ),
      ),
    );
  }
}
Future<bool> showExitPopup(context) async{
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('???? ???????? ?????????? ????????????????',style:getMediumStyle(color: ColorManager.black,fontSize: FontSize.s20) ,),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade800),
                      child: const Text('??????'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('????', style:  TextStyle(color: Colors.black)),
                      ))
                ],
              )
            ],
          ),
        );
      });
}