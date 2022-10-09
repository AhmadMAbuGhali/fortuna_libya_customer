import 'package:easy_localization/easy_localization.dart';
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
                    'createAccount',
                    style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                  ).tr(),
                  SizedBox(height: 8.h),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'typePharmacyName'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'emailEmpty '.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label:  'pharmacyName'.tr(),
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'typePurchasingOfficer'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'purchasingOfficerEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'purchasingOfficer'.tr(),
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'typeEmail'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'emailEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'email'.tr(),
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'typePhoneNumber'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'phoneNumberEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'phoneNumber'.tr(),
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
                        }, child: Text('next',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),).tr())),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'haveAccount'.tr(),
                            style: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14)),
                        TextSpan(
                            text: 'sLogin'.tr(),
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
