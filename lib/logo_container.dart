import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60.0.h,
        width: 88.w,
        child:
        Image(image: AssetImage('images/app logo 2.png')),
      ),
    );
  }
}