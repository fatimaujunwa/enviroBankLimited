
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../controllers/loan_controller.dart';
import '../../helper/logic/payment.dart';
import '../../utils/app_colors.dart';
import '../../utils/text_dimensions.dart';
import '../../widgets/custome_dialogue_box_two.dart';
import '../../widgets/remit_widget.dart';
import '../../widgets/remitted_widget.dart';



class LoanContainerWidget extends StatefulWidget {
  const LoanContainerWidget(
      {Key? key, required this.controller, required this.index, required this.userEmail})
      : super(key: key);
  final int index;
  final LoanController controller;
  final String userEmail;

  @override
  State<LoanContainerWidget> createState() => _LoanContainerWidgetState();
}

class _LoanContainerWidgetState extends State<LoanContainerWidget> {@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.loancontainer,
          height: 100.h,
          width: 350.w,
          child: Row(
            children: [
              widget.controller.getLoanHistory()[widget.index].exist == true
                  ? Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 18,
                    )
                  : Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                      size: 16,
                    ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 200,
                      height: 20,
                      child: Text(
                        widget.controller
                            .getLoanHistory()[widget.index]
                            .reference!,
                        style: TextDimensions.style14InterW600Black,
                        overflow: TextOverflow.ellipsis,
                        // maxLines: 1,
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  (() {
                    DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss")
                        .parse(widget.controller
                            .getLoanHistory()[widget.index]
                            .time!);
                    var inputData = DateTime.parse(parseDate.toString());
                    var outputFormat = DateFormat("yyyy/MM/dd hh:mm:a");
                    var outputDate = outputFormat.format(inputData);
                    return Text(
                      outputDate,
                      style: TextDimensions.style14InterW400Grey,
                    );
                  }()),
                ],
              ),
              Expanded(child: Container()),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.controller.getLoanHistory()[widget.index].amount!,
                    style: TextDimensions.style14InterW600Black,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  widget.controller.getLoanHistory()[widget.index].exist == true
                      ?
RemittedWidget()
                      : RemitWidget(
                          controller: widget.controller,
                          amount: widget.controller
                              .getLoanHistory()[widget.index]
                              .amount!,
                          time: widget.controller
                              .getLoanHistory()[widget.index]
                              .time!,
                          reference: widget.controller
                              .getLoanHistory()[widget.index]
                              .reference!,
                          onPressed: () async {
    CustomDialogue.showCustomDialog(context, okBtnFunction: () async {
      Payment payment= await Payment(ctx: context, price: int.parse(widget.controller.getLoanHistory()[widget.index].amount!), email: widget.userEmail).chargeCard(widget.controller,widget.index);


    },text: 'Are you sure you would like to remit your loan of R${widget.controller
        .getLoanHistory()[widget.index]
        .amount!} with reference number ${widget.controller
        .getLoanHistory()[widget.index]
        .reference!.toUpperCase()}?');


                            //
                            //
                            //   // if(payment.cardResponse==true){
                            //   //   widget.controller.addToRemitItems(


                            //   //       widget.controller
                            //   //           .getLoanHistory()[widget.index]
                            //   //           .time!,
                            //   //       widget.index);
                            //   //   widget.controller.addToRemitHistory();
                            //   //   widget.controller.setOutstandingLoans();
                            //   //   widget.controller.getOutstandingLoan();
                            //   //   widget.controller.getLoanHistory();
                            //   // }
                            //
                            //
                            //
                            //
                            //
                            // },text: 'Are you sure would like to remit your loan of R${widget.controller.getLoanHistory()[widget.index].amount!.toUpperCase()} with loan reference ${ widget.controller
                            //     .getLoanHistory()[widget.index]
                            //     .reference!.toUpperCase()}');



                          },
                        ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),

      ],
    );
  }
}
