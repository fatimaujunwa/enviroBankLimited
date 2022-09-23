

class FirstOnBoardingScreen extends StatelessWidget {
  const FirstOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreenTemplate(
      text: 'Need money?',
      subText: 'Easily apply for loans and get granted',
      logoHeight: 118.1.h,
      illustrationImgPath: 'images/onboarding illustration 1.png',
      blueContainerText: 'Next',

      blueContainerWidth: 105.1.w,skip: (){}, next: ()=>Get.toNamed(RouteHelper.getSecondOnBoarding()),
    );
  }
}
