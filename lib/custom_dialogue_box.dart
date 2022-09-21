import 'package:envirobank/blue_container.dart';
import 'package:envirobank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {
        String okBtnText = "Ok",
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


              children: [
                SizedBox(height: 27.h,),
                Container(
                    height: 32.h,
                    width: 32.w,
                    child: approved?
                    Image(image:
                    AssetImage("images/success icon.png")
,):   Image(image:
AssetImage("images/cancel.png")
,)
),
                SizedBox(height: 18.h,),
                Text(text,style: TextDimensions.style16InterW700AlertBoxBlack,textAlign: TextAlign.center,),
SizedBox(height: 8.h,),
                Text(subText,style: TextDimensions.style16InterW500AlertBoxblack,textAlign: TextAlign.center,),

              ],
            ),
            actions: <Widget>[

              GestureDetector(
                onTap: () => Navigator.pop(context),

                  child: BlueContainer(text:cancelBtnText ,)
                 )
            ],
          );
        });
  }
}