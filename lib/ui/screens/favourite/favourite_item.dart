import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/font_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';

import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        RouterClass.routerClass.navigateTo(NavegatorConstant.productDetails);
      },
      child: Container(
        width: 155.5.w,
        height: 250.h,
        margin: EdgeInsets.symmetric(horizontal: 5.5.w),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 6,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],


        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 5.h,),
            Container(
              width: 155.5.w,
              height: 80.h,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),topRight: Radius.circular(8.r),),
                  image: DecorationImage(image: AssetImage(ImageAssets.item1)
                    //CachedNetworkImageProvider(product.images!.isEmpty?ImageAssets.noImageProduct:product.images?.first.src ??  ImageAssets.noImageProduct
                    ,alignment: Alignment.center, fit: BoxFit.fill,)
              ),
              // child:  Image.network(
              //  product.images!.first.src!,height: 128.h,alignment: Alignment.topCenter, fit: BoxFit.fitWidth,),
            ),
            SizedBox(height: 10.h,),

            Padding(
              padding:  EdgeInsets.only(right: 10.w),
              child: Text('Elasticated Wrist Support',style: getMediumStyle(color: ColorManager.black,fontSize: 14.sp),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '60',
                  style: getBoldStyle(color: ColorManager.green),
                ),
                Icon(Icons.favorite,color: ColorManager.red,)
              ],
            )
          ],),
      ),
    );
  }
}
