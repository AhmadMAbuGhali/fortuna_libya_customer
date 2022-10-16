import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';

import '../../general_component/appbar_custom_widget.dart';
import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKeyCart = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.white,
      key: scaffoldKeyCart,
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        function: () {
          scaffoldKeyCart.currentState?.openDrawer();
        }, title: 'cart'.tr(),
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
                  child: CartItem());
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'المبلغ الإجمالي ',
                  style: getMediumStyle(color: ColorManager.red, fontSize: 13),
                ),
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
              child: Text('تأكيد الطلب',style: getBoldStyle(color: ColorManager.white),),
            ),
            ),
          ],
        ),
      ),
          drawer: DrawarWidget(
              function: () => scaffoldKeyCart.currentState?.closeDrawer()),
    ));
  }
}
