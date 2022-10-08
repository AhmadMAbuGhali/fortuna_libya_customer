import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_customer/resources/color_manager.dart';
import 'package:fortuna_libya_customer/resources/font_manager.dart';
import 'package:fortuna_libya_customer/resources/styles_manager.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild(
      {Key? key, required this.hintText,
        required this.label,
        this.validator,
        this.keyboardType,
        this.suffixIcon,
        this.textInputAction,
        required this.controller,
        this.heightt}) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final double? heightt;
  final TextInputAction? textInputAction;
  final String label;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16),),
          ],
        ),
        SizedBox(height: 7.h,),
        SizedBox(
          child: TextFormField(
            validator: (value) => validator!(value),
            controller: controller,
            focusNode: FocusNode(),
            onFieldSubmitted:   null,
            keyboardType: keyboardType ?? TextInputType.text,
            textInputAction: textInputAction,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              fillColor: ColorManager.white,
              filled: true,
              suffixIcon: suffixIcon,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintText: hintText,
              hintStyle: getRegularStyle(
                  color: ColorManager.otpDesc, fontSize: FontSize.s14),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorManager.borderTextFiel, width: 1.0),
                  borderRadius: BorderRadius.circular(12.r)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: ColorManager.primary, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                    color: ColorManager.borderTextFiel, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

