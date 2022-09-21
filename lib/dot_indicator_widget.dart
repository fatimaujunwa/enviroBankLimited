import 'package:envirobank/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class DotIndicatorCardWidget extends StatelessWidget {
  const DotIndicatorCardWidget({
    Key? key,
    required PageController pageController,
  }) : _pageController = pageController, super(key: key);

  final PageController _pageController;


  @override
  Widget build(BuildContext context) {
    return
      Container(
      // margin: EdgeInsets.only(left: 50),
      child: Align(
        alignment: Alignment.center,
        child: SmoothPageIndicator(

            controller:  _pageController,
            count:  4,
            axisDirection: Axis.horizontal,
            effect:
            CustomizableEffect(dotDecoration: DotDecoration(
              color: AppColors.greyText,borderRadius: BorderRadius.circular(10.r),


            ), activeDotDecoration: DotDecoration(color: AppColors.black,

              width:10.w,borderRadius: BorderRadius.circular(12.1.r),

            ))
        ),
      ),
    );
  }
}