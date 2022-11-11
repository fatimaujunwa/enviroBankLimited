import 'dart:convert';
import 'dart:ffi';


import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/loan_application_model.dart';
import '../../models/loan_model.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';



class LoanRepo {
  //shared preferences for storage
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;
  List<String> loanList = [];
  List<String> remitList = [];
  int loanSum = 0;
  int remitSum = 0;

  int outstandingLoans = 0;
  List<LoanModel> myRemits = [];

  LoanRepo({required this.apiClient, required this.sharedPreferences});

  //gets the loan application response from the server
  Future<Response> loanApplication(Loan application) async {
    return await apiClient.postData(
        AppVariables.LOANAPPLICATION, application.toJson());
  }

//returns a list of all the loans
  List<LoanModel> getLoanHistory() {
    List<String> loans = [];
    if (sharedPreferences.containsKey(AppVariables.LOANHISTORY)) {
      loans = sharedPreferences.getStringList(AppVariables.LOANHISTORY)!;
    }
    List<LoanModel> myLoan = [];
    loans.forEach((element) {
      myLoan.add(LoanModel.fromJson(jsonDecode(element)));
    });

    return myLoan;
  }

//returns list of items added to the remitted items list
  List<LoanModel> getRemitHistory() {
    List<String> remits = [];
    if (sharedPreferences.containsKey(AppVariables.REMITHISTORY)) {
      remits = sharedPreferences.getStringList(AppVariables.REMITHISTORY)!;
    }

    List<LoanModel> myRemits = [];
    remits.forEach((element) {
      myRemits.add(LoanModel.fromJson(jsonDecode(element)));
    });

    return myRemits;
  }

//takes the list of loans and adds it to a share preference object
  void addToLoanHistory(List<LoanModel> loan) {
    if (sharedPreferences.containsKey(AppVariables.LOANHISTORY)) {
      loanList = sharedPreferences.getStringList(AppVariables.LOANHISTORY)!;
    }

    loan.forEach((element) {
      loanSum += int.parse(element.amount!);
      return loanList.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppVariables.LOANHISTORY, loanList);
  }

//adds remitted items to shared preference list
  void addToRemitHistory(List<LoanModel> remits) {
    //checks if item is present in shared preferences
    if (sharedPreferences.containsKey(AppVariables.REMITHISTORY)) {
      remitList = sharedPreferences.getStringList(AppVariables.REMITHISTORY)!;
    }
    List<String> jsonLoanModel = [];
    remits.forEach((element) {
      remitSum += int.parse(element.amount!);

      jsonLoanModel.add(jsonEncode(element));
      return remitList.add(jsonEncode(element));
    });

    List<String> addToRemit =
        sharedPreferences.getStringList(AppVariables.LOANHISTORY)! ?? [];

    sharedPreferences.setStringList(AppVariables.REMITHISTORY, remitList);

//removes element in the loan history similar to the already existing item in the remit list
//     addToRemit.removeWhere((element) => element == jsonLoanModel.join());
//     // addToRemit.where((element) => element == jsonLoanModel.join());

List<LoanModel>model=[];
    List<LoanModel>nextModel=[];
List<String>changeModel=[];
addToRemit.forEach((element) {
  model.add(LoanModel.fromJson(jsonDecode(element)));
});
    model.forEach((elementModel) {
      remits.forEach((element) {
        if(jsonEncode(elementModel)==jsonEncode(element)){
          elementModel.exist=true;
// print('element'+elementModel.toString());
        }
        else{
          // print('negative'+elementModel.toString());
          // print('negativeplus'+element.toString());
        }
        nextModel.add(elementModel);
      }

      );
    });
nextModel.forEach((element) {
  changeModel.add(jsonEncode(element));
});
    // print('change'+changeModel.toString());

    sharedPreferences.setStringList(AppVariables.LOANHISTORY, changeModel);
  }

//this method sets the outstanding loan after subtracting the the remited loan sum from the un remitted loan sum
  void setOutstandingLoan() {
    if (sharedPreferences.containsKey(AppVariables.OUTSTANDINGLOANS)) {
      outstandingLoans =
          sharedPreferences.getInt(AppVariables.OUTSTANDINGLOANS)!;
    }
    outstandingLoans += (loanSum) - (remitSum);
    sharedPreferences.setInt(AppVariables.OUTSTANDINGLOANS, outstandingLoans);
    remitSum = 0;
    loanSum = 0;
  }

//returns the value of the outstanding loan
  int getOutstandingLoan() {
    if (sharedPreferences.containsKey(AppVariables.OUTSTANDINGLOANS)) {
      outstandingLoans =
          sharedPreferences.getInt(AppVariables.OUTSTANDINGLOANS)!;
    }
    return outstandingLoans;
  }
}
