import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_details_item.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../general_component/appbar_custom_widget.dart';


class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKeyOrderDetails = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white,
          key: scaffoldKeyOrderDetails,
          resizeToAvoidBottomInset: false,
          appBar:AppBarWidget(
            function: () {
              scaffoldKeyOrderDetails.currentState?.openDrawer();
            }, title: 'orderDetails'.tr(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: OrderDetailsItem());
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'totalAmount',
                      style: getMediumStyle(color: ColorManager.red, fontSize: 13),
                    ).tr(),
                    Text(
                      '600',
                      style: getMediumStyle(color: ColorManager.red, fontSize: 13),
                    )
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('العودة للرئيسية',style: getBoldStyle(color: ColorManager.white),),
                  ),
                ),
              ],
            ),
          ),
          drawer: DrawarWidget(
              function: () => scaffoldKeyOrderDetails.currentState?.closeDrawer()),
        ));
  }
}
