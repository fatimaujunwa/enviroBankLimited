import 'package:enviro_bank/blue_container.dart';
import 'package:enviro_bank/route_helper.dart';
import 'package:enviro_bank/tab_bar_widget.dart';
import 'package:enviro_bank/text_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app_colors.dart';
import 'loan_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // late  LoanController controller= Get.find<LoanController>();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();

// WidgetsBinding.instance?.addPostFrameCallback((timeStamp)async {
//   controller= Get.find<LoanController>();
// });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whitePageBackground,
        body:
            // Get.find<LoanController>().isLoading?
            // Center(child: CircularProgressIndicator(color: AppColors.darkBlue,)) :
            SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  top: -2.h,
                  right: 0.w,
                  child: Container(
                    margin: EdgeInsets.only(left: 120.w),
                    // height: 76.h,
                    // width: 346.w,
                    child: Image(
                      image: AssetImage("images/home-cutout.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 75.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 32.w, right: 32.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.w,
                                child: Image(
                                  image: AssetImage("images/Account icon.png"),
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Container(
                                height: 40.h,
                                width: 300.w,
                                child: Text(
                                  'Welcome to Enviro Bank Limited!',
                                  style: TextDimensions.style18InterW500Black,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 31.h,
                          ),
                          Center(
                              child: Text(
                            'Outstanding loan',
                            style: TextDimensions.style16InterW500Grey,
                          )),
                          SizedBox(
                            height: 8.h,
                          ),
                          GetBuilder<LoanController>(builder: (controller) {
                            return Center(
                              child: Text(
                                'R' +
                                    controller.getOutstandingLoan().toString() +
                                    '.00',
                                style: TextDimensions.style36InterW500Blue,
                              ),
                            );
                          }),
                          SizedBox(
                            height: 25.h,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(
                                RouteHelper.getApplyLoan(widget.userEmail)),
                            child: Container(
                              height: 77.h,
                              width: 350.w,
                              decoration: BoxDecoration(
                                  color: AppColors.darkBlue,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(-2, -2),
                                        blurRadius: 10,
                                        color: AppColors.whiteColor),
                                    BoxShadow(
                                        offset: Offset(3, 3),
                                        blurRadius: 16,
                                        color:
                                            AppColors.greyText.withOpacity(0.3))
                                  ]),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 17.w,
                                  ),
                                  Container(
                                    height: 41.54,
                                    width: 41.54,
                                    child: Image(
                                      image: AssetImage("images/rand icon.png"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Center(
                                    child: Text(
                                      'Apply for a loan',
                                      style:
                                          TextDimensions.style20InterW500White,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            'History',
                            style: TextDimensions.style18InterW500Black,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          CustomTabBar(
                            tabController: _tabController,
                            userEmail: widget.userEmail,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
