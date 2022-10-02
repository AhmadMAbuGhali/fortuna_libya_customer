import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../home_screens/home_screen.dart';
import '../profile/profile_screen.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
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
            'تفاصيل المنتج',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  height: 250,
                  child: Image.asset(ImageAssets.item1),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Gel Heel Cushions For Men ',
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: 18),
                  ),
                  Text(
                    ' 60 ',
                    style:
                        getBoldStyle(color: ColorManager.green, fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'مثالية لجميع الأحذية. تم تصميم وسائد الكعب فورتونا جل لحماية كعب وإعطاء تعزيز الراحة عن طريق خفض مستوى التأثير على كعب أثناء المشي أو الوقوف. توجيهات الاستخدام: الوسائد مكان كعب ضد القسم الخلفي من كعب الحذاء والضغط في المكان عند لباس الحذاء .',
                style: getRegularStyle(color: ColorManager.gray, fontSize: 15),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Text(
                    'الكمية',
                    style:
                        getBoldStyle(color: ColorManager.black, fontSize: 18),
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  SizedBox(
                      height: 40.h,
                      width: 75.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  BorderSide(color: ColorManager.primary)),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 44.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        border: Border.all(color: ColorManager.primary),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset(
                          IconAssets.cart,
                          color: ColorManager.white,
                          height: 20,
                          width: 20,
                        ),
                        Text(
                          'إضافة الى السلة',
                          style: getBoldStyle(
                              color: ColorManager.white, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    child: Container(
                      height: 44.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          border: Border.all(color: ColorManager.primary),
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          isFav == false
                              ? Icon(Icons.favorite_border)
                              : Icon(
                                  Icons.favorite,
                                  color: ColorManager.red,
                                ),
                          isFav == false
                              ? Text(
                                  'إضافة الى المفضلة',
                                  style: getBoldStyle(
                                      color: ColorManager.black, fontSize: 16),
                                )
                              : Text(
                                  'إزالة من المفضلة',
                                  style: getBoldStyle(
                                      color: ColorManager.black, fontSize: 16),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
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
