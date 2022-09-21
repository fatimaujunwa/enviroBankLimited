import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:enviro_bank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownvalue = 'Select Bank';
  var items = [
    'Select Bank',
    'NEDBANK_LIMITED',
    'VBS',
    'FNB',
    'INVESTEC_LIMITED',
    'ABSA',
    'STANDARD_BANK'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bank Name',style: TextDimensions.style18InterW500Black,),
          SizedBox(height: 8.h,),
          Container(
            padding: EdgeInsets.only(left: 10.w),
          height: 58.0.h,
          width: 350.w,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(12.r),
            color: AppColors.textFieldColor,
          ),

              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select Item',
                    style:TextDimensions.style14InterW400Grey,
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextDimensions.style14InterW400Grey
                    ),
                  ))
                      .toList(),
                  value: dropdownvalue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      widget.controller.text=dropdownvalue;
                    });
                  },
                  buttonHeight: 40,
                  buttonWidth: 140,
                  itemHeight: 40,
                ),
              )),
        ],
      ),
    );
  }
}

