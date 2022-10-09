import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fortuna_libya_customer/navigator/router_class.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';
import 'package:fortuna_libya_customer/ui/screens/favourite/favourite_item.dart';
import 'package:fortuna_libya_customer/ui/screens/home_screens/home_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/limit_offer/limited_offer_item.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/product/product_details.dart';
import 'package:fortuna_libya_customer/ui/screens/profile/profile_screen.dart';

class FavouriteScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
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
            'المفضلة',
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
                  hintText: "searchProduct".tr(),
                ),
              ),
              //tab bar
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      // width / height: fixed for *all* items
                      childAspectRatio: 0.95,
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            RouterClass.routerClass
                                .pushWidgetReplacement(
                                ProductDetails());
                          },
                          child: FavouriteItem());
                    }),
              ),
            ],
          ),
        ),
        drawer: DrawarWidget(
            function: () => scaffoldKey.currentState?.closeDrawer()),
      ),
    );
  }
}
