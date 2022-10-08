import 'package:dropdown_button2/dropdown_button2.dart';
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

class SignUpScreen2 extends StatelessWidget {

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> signFormkey = GlobalKey<FormState>();
  SignUpScreen2({Key? key}) : super(key: key);

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
                  Row(
                    children: [
                      SizedBox(width: 16.w,),
                      Text(
                        'المدينة',
                        style: getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
                      ),
                     const Spacer()
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorManager.primary,
                      ),
                      iconSize: 30.sp,
                      buttonHeight: 44.h,
                      buttonPadding: const EdgeInsets.only(left: 12, right: 12),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      items: ['item','item2','item3']
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'يجب تحديد تصنيف المهمة';
                        }
                        return null;
                      },
                      onChanged: (value) {

                      },
                    ),
                  ),
                  // Padding(
                  //   padding:   EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: CustomTextFormFiled(
                  //     label: 'المدينة ',
                  //     hint: 'المدينة',
                  //     controller: _userNameController,
                  //     enable: true,
                  //   ),
                  // ),
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
                              .navigateTo(NavegatorConstant.homeApp);
                        }, child: Text('انشاء حساب',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
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
