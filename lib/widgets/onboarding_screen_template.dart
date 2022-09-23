import 'package:envirobank/app_colors.dart';
import 'package:envirobank/blue_container.dart';

import 'package:envirobank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'logo_container.dart';


// Expanded(child: DotIndicatorCardWidget(pageController: _pageController)),
class OnBoardingScreenTemplate extends StatelessWidget {
   OnBoardingScreenTemplate({Key? key,  this.illustrationImgPath = '',
    this.subText = '',
    this.text = '',
    this.nextSlide = true,
    this.logoHeight = 0.0,
    this.blueContainerText = '',
    this.showSkip = '',
    this.blueContainerWidth = 0.0,
    required this.next,
    required this.skip}) : super(key: key);
  final String illustrationImgPath;
  final String text;
  final String subText;
  final bool nextSlide;
  final double logoHeight;
  final String showSkip;
  final String blueContainerText;
  final Function ()next;
  final Function() skip;
  final double blueContainerWidth;
  PageController _pageController = PageController(viewportFraction: 0.9.h);
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.whitePageBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 122.69.h),
              color: AppColors.whitePageBackground,
              height: 300.1.h,
              width: 300.w,
              child: Image(image: AssetImage(illustrationImgPath)),
            ),
          ),
          SizedBox(
            height: 36.92.h,
          ),
          Container(
            // margin: EdgeInsets.only(left: 50),
            child: Align(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 2,
                  axisDirection: Axis.horizontal,
                  effect: CustomizableEffect(
                      dotDecoration: DotDecoration(
                          color: nextSlide
                              ? Color(0xffD9D9D9)
                              : AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(8.r),
                          width: nextSlide ? 21.w : 40.w),
                      activeDotDecoration: DotDecoration(
                        color: nextSlide
                            ? AppColors.darkBlue
                            : Color(0xffD9D9D9),
                        width:nextSlide ? 40.w : 21.w,
                        borderRadius: BorderRadius.circular(8.r),
                      ))),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
           text,
            style: TextDimensions.style32InterW600Black,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
           subText,
            style: TextDimensions.style18InterW500Grey,
          ),
          SizedBox(
            height: 36.h,
          ),
          GestureDetector(
            onTap: next,
            child: BlueContainer(
              text: blueContainerText,
              width: blueContainerWidth,
              height: 52.h,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          GestureDetector(
            onTap: skip,
            child: Container(

              child: Text(
               showSkip,
                style: TextDimensions.style18InterW500Blue,
              ),
            ),
          ),
          SizedBox(
            height: logoHeight,
          ),
          LogoContainer()
        ],
      ),
    );
  }
}
