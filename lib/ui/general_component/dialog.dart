import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String descriptions;

  const CustomDialogBox({Key? key,required this.title,required this.descriptions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          margin:  EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const[
                 BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              const SizedBox(height: 15,),
              Text(descriptions,style: const TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              const SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child:const Text('OK',style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),

      ],
    );
  }
}