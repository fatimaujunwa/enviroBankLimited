import 'package:envirobank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class RemittedWidget extends StatelessWidget {
  const RemittedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 33.h,
      width: 75.w,
      decoration: BoxDecoration(
          color: AppColors.darkBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(-2, -2),
                blurRadius: 10.0,
                color: AppColors.whiteColor),
            BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 16,
                color: AppColors.greyText.withOpacity(0.3))
          ]),
      child: Center(
        child: Text(
          'Remitted',
          style: TextDimensions.style14InterW500White,
        ),
      ),
    );
  }
}
