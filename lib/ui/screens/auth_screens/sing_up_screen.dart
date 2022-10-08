import 'package:flutter/gestures.dart';
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
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> signFormkey = GlobalKey<FormState>();
   SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: signFormkey,
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
                    'انشاء حساب',
                    style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'أدخل البريد الإلكتروني',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'البريد الإلكتروني مطلوب ';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'البريد الإلكتروني',
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'أدخل البريد الإلكتروني',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'البريد الإلكتروني مطلوب ';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'البريد الإلكتروني',
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'أدخل البريد الإلكتروني',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'البريد الإلكتروني مطلوب ';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'البريد الإلكتروني',
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'أدخل البريد الإلكتروني',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'البريد الإلكتروني مطلوب ';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'البريد الإلكتروني',
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton(onPressed: (){
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.signUp2);
                        }, child: Text('التالي',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: ' لديك حساب ؟',
                            style: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14)),
                        TextSpan(
                            text: 'تسجيل الدخول',
                            style: getBoldStyle(color:ColorManager.primary,fontSize: FontSize.s14),
                            recognizer:  TapGestureRecognizer()..onTap = () => RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.login)
                        ),

                      ],
                    ),
                  ),
                ]),
          ),
        );
      }),
    );
  }
}
