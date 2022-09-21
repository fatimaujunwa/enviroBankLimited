import 'package:flutter/services.dart';

class LoanModel{
  String? time;
  String? reference;
  String? amount;
  bool?exist;


  LoanModel({this.reference,this.amount,this.time, this.exist});
  LoanModel.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    amount = json['amount'];
exist=json['exist'];
    time=json['time'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return{
      'reference':this.reference,
      'amount':this.amount,
'exist':this.exist,
      'time':this.time,


    };
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'Loan is ${time}, ${reference},${amount} ,${exist}';
  }
}