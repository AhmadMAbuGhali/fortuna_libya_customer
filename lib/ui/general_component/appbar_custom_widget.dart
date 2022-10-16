import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../navigator/router_class.dart';
import '../../navigator/routes_const.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({  Key? key,required this.function,required this.title}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);
  final VoidCallback? function;
  final String title;
  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          onPressed:function

          ,
          icon: Icon(
            Icons.menu,
            color: ColorManager.black,
          )),
      title: Text(
        title
            ,
        style: getBoldStyle(color: ColorManager.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            RouterClass.routerClass
                .navigateTo(NavegatorConstant.cart);
          },
          icon: SvgPicture.asset(IconAssets.cart),
        ),
      ],
    );
  }
}
