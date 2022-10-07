
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_customer/navigator/router_class.dart';
import 'package:fortuna_libya_customer/navigator/routes_const.dart';
import 'package:fortuna_libya_customer/resources/assets_manager.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/font_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';
import 'package:fortuna_libya_customer/services/auth_provider.dart';
import 'package:fortuna_libya_customer/ui/general_component/custom_text_form_filed.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NewPassword extends StatelessWidget {
  final TextEditingController passController = TextEditingController();

  GlobalKey<FormState> pFormkey = GlobalKey<FormState>();
  NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: pFormkey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 59.h),
                  SizedBox(
                    height: 155.h,
                    width: 155.w,
                    child: Image.asset(
                      ImageAssets.logo,
                      height: 332.h,
                      width: 332.w,
                    ),
                  ),
                  Text(
                    'قم بإدخال كلمة مرور جديدة',
                    style: getMediumStyle(color: ColorManager.otpDesc, fontSize: FontSize.s14),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomTextFormFiled(
                      label: 'كلمة المرور',
                      hint: 'ادخل كلمة المرور',
                      controller: passController,
                      enable: true,
                    ),
                  ),


                  SizedBox(
                    height: 137.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton(onPressed: (){
                          showCustomDialog(context,'assets/animation/successTick.json','تم تغيير كلمة المرور');
                          Timer(const Duration(seconds: 3), () {
                            RouterClass.routerClass.navigateTo(NavegatorConstant.login);
                          });

                        }, child: Text('تأكيد',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
                  ),

                ]),
          ),
        );
      }),
    );
  }
  void showCustomDialog(BuildContext context,String animation,String massage) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 250.h,
            width: 280.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(22.r)),
            child: Column(children: [
              SizedBox(
                width: 120.w,
                height: 120.h,
                child: Lottie.asset(
                    animation,
                    width: 120.w,
                    height: 120.h,
                    fit: BoxFit.cover
                ),
              ),
              SizedBox(height: 15.h,),
              Center(child: Text(
                massage,
                style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s22),
                textAlign: TextAlign.center,
              ))
            ],),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
}
