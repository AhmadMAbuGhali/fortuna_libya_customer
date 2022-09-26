import 'package:flutter/material.dart';
import 'package:fortuna_libya_customer/ui/screens/home_screens/home_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/order/order_screen.dart';
import 'package:fortuna_libya_customer/ui/screens/product/product_details.dart';
import 'package:fortuna_libya_customer/ui/screens/profile/profile_screen.dart';

class RouterClass {
  RouterClass._();
  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  pushWidget(Widget widget) {
    navKey.currentState?.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  pushWidgetReplacement(Widget widget) {
     navKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
  pushWidgetRemovePrev(Widget widget){
    navKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
    return widget;
    }), (route) => false);

  }

  popFunction() {
    navKey.currentState?.pop();
  }

  Map<String, Widget Function(BuildContext)> map = {
      // 'NavHome': (context) => const MainNavBar(),
       'Home': (context) =>  HomeScreen(),
       'Profile': (context) =>  ProfileScreen(),
       'ProductDetails': (context) =>  ProductDetails(),
       'Order': (context) =>  OrderScreen(),
  };
}
