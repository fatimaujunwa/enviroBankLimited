import 'package:envirobank/app_colors.dart';
import 'package:envirobank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDialogue {
  static CustomDialogue _instance = new CustomDialogue.internal();

  CustomDialogue.internal();

  factory CustomDialogue() => _instance;

  static void showCustomDialog(BuildContext context,
      {
        String okBtnText = "Yes",
        String cancelBtnText = "Cancel",
        String text='',
        String subText='',
        bool approved=true,
        required Function() okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(

            content:Column(
              mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 27.h,),
                Container(
                    height: 32.h,
                    width: 32.w,
                    child: approved?
                    Image(image:
                    AssetImage("images/help.png")
                      ,):   Container()
                ),
                SizedBox(height: 18.h,),
                Text(text,style: TextDimensions.style16InterW700AlertBoxBlack,

                textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h,),
                Text(subText,style: TextDimensions.style16InterW500Grey,  textAlign: TextAlign.center,),

              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),

                    child: Container(
                      height: 52.h,
                      width:123.w ,
                      child: Center(child: Text(cancelBtnText,style: TextDimensions.style18InterW500Grey,)),

                      decoration: BoxDecoration(
                          color: Color(0xffE0E0E0),
                          borderRadius: BorderRadius.circular(12.r)
                      ),
                    )
                ),
                GestureDetector(
                    onTap: okBtnFunction,

                    child: Container(

          height: 52.h,width: 95.w,
                      decoration: BoxDecoration(
          color:Color(0xff27A845),
                          borderRadius: BorderRadius.circular(12.r)
                      ),

                      child: Center(child: Text(okBtnText,style: TextDimensions.style18InterW500White,)),
                    )
                )
              ],)

            ],
          );
        });
  }
}