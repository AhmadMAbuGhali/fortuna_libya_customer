import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fortuna_libya_customer/navigator/router_class.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_details.dart';

class ActiveOrder extends StatelessWidget {
  const ActiveOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorManager.primary,
                      width: 1,
                      style: BorderStyle.solid),
                ),
                child: Image.asset(
                  ImageAssets.onboarding1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'طلبيات مواد طبية 1',
                  style: getBoldStyle(color: ColorManager.black, fontSize: 15),
                ),
                Text(
                  '14/12/2022',
                  style: getRegularStyle(color: ColorManager.red, fontSize: 10),
                ),
                Text(
                  '600',
                  style:
                      getRegularStyle(color: ColorManager.green, fontSize: 10),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0,left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35,
                    width: 128,
                    child: ElevatedButton(
                        onPressed: () {
                          RouterClass.routerClass.pushWidget(OrderDetails());
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),

                              )
                          )
                        ),
                        child: Center(
                          child: Text('trackOrder',style: getRegularStyle(color: ColorManager.white,fontSize: 14),).tr(),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
