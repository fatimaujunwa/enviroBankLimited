import 'package:envirobank/loan_controller.dart';
import 'package:envirobank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class RemitWidget extends StatelessWidget {
  const RemitWidget({
    Key? key, required this.controller,
    required this.time,
    required this.amount,
    required this.reference,
required this.onPressed,



  }) : super(key: key);
final LoanController controller;
final String amount;
final String time;
final String reference;


final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
    onTap: onPressed,
      child:

      Container(
        height:  33.0.h,
        width:  70.w,
        decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(offset: Offset(-2,-2),
                  blurRadius: 10,
                  color: AppColors.whiteColor
              ),
              BoxShadow(offset: Offset(3,3),
                  blurRadius: 16,
                  color: AppColors.greyText.withOpacity(0.3)
              )
            ]
        ),
        child: Center(child: Text('Remit',style: TextDimensions.style14InterW500White,),),
      ),
    );
  }
}