import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController{
  Future<void> datePicker( TextEditingController collectionDate,BuildContext context ) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      print(
          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate =
      DateFormat('yyyy-MM-dd').format(pickedDate);
      // print(
      // formattedDate); //formatted date output using intl package =>  2021-03-16
      collectionDate.text= formattedDate;
      update();
      // setState(() {
      //
      //   collectionDate.text =
      //       formattedDate; //set output date to TextField value.
      // }
      //
      // );
    } else {}

    print(collectionDate.text);

  }




}