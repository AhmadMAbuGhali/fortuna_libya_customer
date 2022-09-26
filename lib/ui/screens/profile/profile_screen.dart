import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fortuna_libya_customer/ui/general_component/custom_text_form_filed.dart';
import 'package:image_picker/image_picker.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../home_screens/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  File? imageFile;
  TextEditingController name = TextEditingController();

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
            'الملف الشخصي',
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
                  CustomTextFormFiled(
                    label: 'الإسم',
                    hint: 'ليبيا الأمل',
                    controller: name,
                    enable: false,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //name of owner
                  CustomTextFormFiled(
                    label: 'مالك الصيدلية',
                    hint: 'أحمد أبو غالي',
                    controller: name,
                    enable: false,
                  ),
                  // mobile number
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormFiled(
                    label: 'رقم الهاتف',
                    hint: '+218 92-848418',
                    controller: name,
                    enable: false,
                  ),
                  //email
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormFiled(
                    label: 'البريد الالكتروني',
                    hint: 'email@example.com',
                    controller: name,
                    enable: false,
                  ),
                  //city
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormFiled(
                    label: 'المدينة',
                    hint: 'طرابلس',
                    controller: name,
                    enable: true,
                  ),
                  //address
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormFiled(
                    label: 'العنوان',
                    hint: 'طريق جامع الصقع',
                    controller: name,
                    enable: true,
                  ),
                  //password
                  SizedBox(
                    height: 20.h,
                  ),

                  CustomTextFormFiled(
                    label: 'كلمة المرور',
                    hint: '*******************',
                    controller: name,
                    enable: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: ColorManager.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // arrow to close Drawer
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (scaffoldKey.currentState!.isDrawerOpen) {
                            scaffoldKey.currentState!.closeDrawer();
                            //close drawer, if drawer is open
                          }
                        },
                        icon: SvgPicture.asset(
                          IconAssets.arrow,
                          height: 18.h,
                          width: 18.w,
                        )),
                  ],
                ),
                //CircleAvatar
                CircleAvatar(
                  radius: 50,
                  child: Image.asset(ImageAssets.onboarding1),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'ليبيا الأمل',
                  style: getBoldStyle(color: ColorManager.black, fontSize: 19),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'المبلغ المدين',
                  style:
                  getRegularStyle(color: ColorManager.black, fontSize: 19),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  height: 60.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            Color(0xFF60CCE8),
                            Color(0xFF083844),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                        '5400',
                        style:
                        getBoldStyle(color: ColorManager.white, fontSize: 22),
                      )),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          //home
                          GestureDetector(
                            onTap: (){
                              RouterClass.routerClass.pushWidgetReplacement(HomeScreen());
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.home_filled,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Text(
                                  " الرئيسية",
                                  style: getBoldStyle(
                                      color: ColorManager.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //profile
                          GestureDetector(
                            onTap: (){
                              RouterClass.routerClass.pushWidgetReplacement(ProfileScreen());
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Text(
                                  " الملف الشخصي",
                                  style: getBoldStyle(
                                      color: ColorManager.black, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //order
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.order,
                                color: ColorManager.black,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                " الطلبات",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //limit
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.limit,
                                color: ColorManager.black,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                "الكمية المحدودة",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //offer
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.offer,
                                color: ColorManager.black,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                " العروض",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //notification
                          Row(
                            children: [
                              const Icon(
                                Icons.notifications,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                " الإشعارات",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //favorite
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                "المفضلة",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          // point
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.point,
                                color: ColorManager.black,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                "  النقاط",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //language
                          Row(children: [
                            Expanded(
                              child: ExpansionTile(
                                leading: const Icon(
                                  Icons.language,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  'اللغة',
                                  style: getBoldStyle(
                                      color: ColorManager.black, fontSize: 18),
                                ),
                                tilePadding: const EdgeInsets.all(-5),
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'عربي',
                                              style: getRegularStyle(
                                                  color: ColorManager.black,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'English',
                                              style: getRegularStyle(
                                                  color: ColorManager.black,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //support
                          Row(
                            children: [
                              const Icon(
                                Icons.headset_mic_sharp,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                " الدعم الفني",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          //logout
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.logout,
                                color: ColorManager.black,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Text(
                                " تسجيل الخروج",
                                style: getBoldStyle(
                                    color: ColorManager.black, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
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

