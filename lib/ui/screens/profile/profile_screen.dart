import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna_libya_customer/ui/general_component/drawar_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../general_component/appbar_custom_widget.dart';
import '../../general_component/custom_text_form_filed.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> scaffoldKeyProfile = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  File? imageFile;
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKeyProfile,
        appBar: AppBarWidget(
          function: () {
            scaffoldKeyProfile.currentState?.openDrawer();
          }, title: 'profile'.tr(),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheet(),
                          );

                          // setState(() {
                          //   _getFromGallery();
                          // });
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 60,
                            foregroundImage: imageFile == null
                                ? Image.asset(
                                    ImageAssets.upload,
                                  ).image
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                            backgroundImage: imageFile == null
                                ? Image.asset(
                                    ImageAssets.upload,
                                  ).image
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Center(
                    child: Text(
                      'تعديل صورة الملف الشخصي',
                      style: getBoldStyle(color: ColorManager.black),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //name
                  CustomTextFeild(
                    controller:name,
                    textEnable: false,
                    hintText: 'صيدلية الامل'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'pharmacyNameEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'pharmacyName'.tr(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //name of owner
                  CustomTextFeild(
                    controller:name,
                    textEnable: false,
                    hintText: 'محمد عاشور'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'purchasingOfficerEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'purchasingOfficer'.tr(),
                  ),
                  // mobile number
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFeild(
                    controller:name,
                    textEnable: false,
                    hintText: '+132465987'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'phoneNumberEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'phoneNumber'.tr(),
                  ),
                  //email
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFeild(
                    controller:name,
                    textEnable: false,
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
                  //city
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFeild(
                    controller:name,

                    hintText: 'طرابلس'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'chooseCity'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'city'.tr(),
                  ),
                  //address
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFeild(
                    controller:name,

                    hintText: 'طريق جامع الصقع'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'addressEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'address'.tr(),
                  ),
                  //password
                  SizedBox(
                    height: 20.h,
                  ),

                  CustomTextFeild(
                    controller:name,
                    textEnable: false,
                    hintText: '*************'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'passwordEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'password'.tr(),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  Container(
                    width: double.infinity,
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 16.w ),
                    child: ElevatedButton(onPressed: (){
                      RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.homeApp);
                    },style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        side: BorderSide(color: ColorManager.white, width: 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r))), child: Text('حفظ التغيرات',
                      style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: DrawarWidget(
            function: () => scaffoldKeyProfile.currentState?.closeDrawer()),
      ),
    );
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Widget bottomSheet() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Choose Image from',
            style: getBoldStyle(color: ColorManager.primary),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _getFromCamera();
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.camera_alt_rounded)),
                  Text("Camera"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _getFromGallery();
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.image)),
                  Text("Gallery"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

