// import 'package:enviro_bank/route_helper.dart';
// import 'package:enviro_bank/text_dimensions.dart';
// import 'package:enviro_bank/user_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'app_colors.dart';
// import 'authentication.dart';
//
// class GoogleContainer extends StatefulWidget {
//   const GoogleContainer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<GoogleContainer> createState() => _GoogleContainerState();
// }
//
// class _GoogleContainerState extends State<GoogleContainer> {
//   bool done =false;
//   @override
//   Widget build(BuildContext context) {
//
//     return GestureDetector(
//       onTap: (){
//
//       Get.find<AuthenticationController>().googleLogin().then((value) {
//
//     Get.toNamed(RouteHelper.getHomeScreen(value));
//
//         });},
//       child:
//       done==true ?CircularProgressIndicator(color: AppColors.darkBlue,):
//       Container(
//         height: 53.h,
//         width: 171.w,
//         decoration: BoxDecoration(
//             color: AppColors.whiteColor,
//             borderRadius: BorderRadius.circular(12.r),
//             boxShadow: [
//               BoxShadow(offset: Offset(-2,-2),
//                   blurRadius: 10,
//                   color: AppColors.whiteColor
//               ),
//               BoxShadow(offset: Offset(3,3),
//                   blurRadius: 16,
//                   color: AppColors.greyText.withOpacity(0.3)
//               )
//             ]
//         ),
//         child: Padding(
//           padding:EdgeInsets.only(left:45.15.h ),
//           child: Row(children: [
//             Container(
//
//                 height: 30.h,
//                 width: 30.w,
//                 child: Image(image: AssetImage('images/ntisa-google-icon.png'))),
//             SizedBox(width:10.w),
//             Text('Google',style: TextDimensions.style18InterW500Blue,)
//           ],),
//         ),
//       ),
//     );
//   }
// }