
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_dimensions.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.hintText = '',
      this.suffixIcon = false,
      this.obsText = false,
      this.width=0.0,
        this.height=0.0,
       required this.controller,
      required  this.dateTime

      })
      : super(key: key);
  final String hintText;
  final bool suffixIcon;
  final bool obsText;
  final double height;
  final double width;
  final TextEditingController controller;

  final Function()dateTime;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool visibility=false;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(12.r),
        ),

        child:
        TextField(
          onTap:widget.dateTime ,
          style: TextDimensions.style14InterW400Grey,
          controller: widget.controller,
          obscureText:visibility ? true : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
              hintStyle: TextDimensions.style14InterW400Grey,
              isDense: true,

              counterText: "",
              suffixIcon: widget.suffixIcon
                  ?
              InkWell(
                onTap: (){

          setState(() {
            visibility=!visibility;
          });
                },
                    child: visibility?Icon(Icons.visibility_off,color: AppColors.greyText,size: 20,):
                      Icon(Icons.visibility,color: AppColors.greyText,size: 20,),
                  )
                  : Text(''),
              filled: true,
              fillColor: AppColors.textFieldColor,
              border: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  borderSide: BorderSide.none)),
          textAlign: TextAlign.start,
          maxLines: 1,
          maxLength: 20,
          // controller: _locationNameTextController,
        )
      );
  }
}
