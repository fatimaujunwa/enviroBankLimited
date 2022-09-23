
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_dimensions.dart';



class BlueContainer extends StatelessWidget {
  const BlueContainer({Key? key,this.text='',this.width=0.0,this.height=0.0}) : super(key: key);
final String text;
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
      return
        Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(12.r),
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
      child: Center(child: Text(text,style: TextDimensions.style18InterW500White,),),
    );
  }
}
