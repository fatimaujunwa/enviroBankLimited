import 'package:envirobank/text_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'app_colors.dart';
import 'loan_container_widget.dart';
import 'loan_controller.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar(
      {Key? key, required TabController tabController, required this.userEmail})
      : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final String userEmail;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var loans = Get.find<LoanController>();
    print(widget.userEmail);
    print(loans.isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 495.0.h,
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColors.textFieldColor,
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
              ),
              child: TabBar(
                controller: widget._tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                  color: AppColors.darkBlue,
                ),
                unselectedLabelStyle: TextDimensions.style18InterW500Black,
                labelStyle: TextDimensions.style18InterW500White,
                labelColor: AppColors.whiteColor,
                unselectedLabelColor: AppColors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Loans',
                  ),

                  // second tab [you can add an icon using the icon property]

                  Tab(
                    text: 'Remits',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: widget._tabController,
                children: [
                  // first tab bar view widget

                  GetBuilder<LoanController>(builder: (controller) {
                    return controller.getLoanHistory().length == 0
                        ? NoLoanOrRemitWidget(
                            text: 'No loans applied for yet!',
                            subtext: 'Click on APPLY FOR A LOAN to start',
                          )
                        : ListView.builder(
                            itemCount: controller.getLoanHistory().length,
                            itemBuilder: (_, index) {
                              return LoanContainerWidget(
                                index: index,
                                controller: controller,
                                userEmail: widget.userEmail,
                              );
                            });
                  })

                  // second tab bar view widget
                  ,
                  GetBuilder<LoanController>(builder: (controller) {
                    return controller.getRemitHistory().length == 0
                        ? NoLoanOrRemitWidget(
                            text: 'You have not remitted any of your loans!',
                            subtext: 'Click on REMIT on your loans at the loan tab to start',
                          )
                        : ListView.builder(
                            itemCount: controller.getRemitHistory().length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Container(
                                    color: AppColors.loancontainer,
                                    height: 100.h,
                                    width: 350.w,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_upward,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: 200.w,
                                                height: 20.h,
                                                child: Text(
                                                  controller
                                                      .getRemitHistory()[index]
                                                      .reference!,
                                                  style: TextDimensions
                                                      .style14InterW600Black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  // maxLines: 1,
                                                )),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            (() {
                                              DateTime parseDate = DateFormat(
                                                      "yyyy-MM-dd HH:mm:ss")
                                                  .parse(controller
                                                      .getRemitHistory()[index]
                                                      .time!);
                                              var inputData = DateTime.parse(
                                                  parseDate.toString());
                                              var outputFormat = DateFormat(
                                                  "yyyy/MM/dd hh:mm:a");
                                              var outputDate = outputFormat
                                                  .format(inputData);
                                              return Text(
                                                outputDate,
                                                style: TextDimensions
                                                    .style14InterW400Grey,
                                              );
                                            }()),
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller
                                                  .getRemitHistory()[index]
                                                  .amount!,
                                              style: TextDimensions
                                                  .style14InterW600Black,
                                            ),
                                            SizedBox(
                                              height: 18.h,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  )
                                ],
                              );
                            });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}

class NoLoanOrRemitWidget extends StatelessWidget {
  const NoLoanOrRemitWidget(
      {Key? key, required this.text, required this.subtext})
      : super(key: key);
  final String text;
  final String subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 87.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 30.w),
            // color: Colors.red,
            width: 165.07, height: 123,
            child: Image(image: AssetImage('images/no-record.png')),
          ),
          SizedBox(
            height: 11.72.h,
          ),
          Text(
            text,
            style: TextDimensions.style18InterW500Blue,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            subtext,
            style: TextDimensions.style16InterW500Grey,
          )
        ],
      ),
    );
  }
}
//'No loans applied for yet!'
//'Click on APPLY FOR A LOAN to start'
