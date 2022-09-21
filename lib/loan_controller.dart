import 'dart:convert';

import 'package:enviro_bank/loan_application_model.dart';
import 'package:enviro_bank/loan_application_response.dart';
import 'package:enviro_bank/loan_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'loan_model.dart';

class LoanController extends GetxController implements GetxService {
  final LoanRepo loanRepo;
  List<dynamic> _loan = [];
  int i = 0;
  bool _addToRemits = false;
  bool get addToRemits => _addToRemits;

  List<dynamic> get loan => _loan;
  Map<int, LoanModel> _items = {};

  Map<int, LoanModel> get items => _items;
  Map<int, LoanModel> _newLoans = {};

  Map<int, LoanModel> get loans => _loans;
  Map<int, LoanModel> _remitItems = {};
  Map<int, LoanModel> _loans = {};
  Map<int, bool>? _remitMap = {-1: false};
  Map<int, bool>? get remitMap => _remitMap;

  Map<int, LoanModel> get newLoans => _newLoans;
  Map<int, LoanModel> get remitItems => _remitItems;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  LoanController({required this.loanRepo});

  set setItems(Map<int, LoanModel> setItems) {
    _items = {};
    _items = setItems;
  }

//adding all loans to history by saving in sharedprefences object
  void addToLoanHistory() {
    loanRepo.addToLoanHistory(getItems);
    update();
  }
  // void removeFromSharedPreferences(int index){
  //   loanRepo.removeFromSharedPreferences(index);
  // }


//adds all loans remmitted to history by storing in sharedpreferences
  void addToRemitHistory() {
    loanRepo.addToRemitHistory(getRemitItems);

    update();
  }
  //adds all the loans remmitted to a map and then returning it in a loan model

  void addToRemitItems(
      String reference, String amount, String time, int index) {
    _remitItems = {};
    _remitItems.putIfAbsent(index, () {
      return LoanModel(time: time, reference: reference, amount: amount,exist: false);
    });
  }

  int getOutstandingLoan() {
    // Future.delayed(Duration(milliseconds: 20), () {
    //   update();
    // });
    return loanRepo.getOutstandingLoan();
  }
//adds all the loans to a loan model using the refernce and amount
  void addToLoanItems(String reference, String amount) {
    _items = {};
    _items.putIfAbsent(i++, () {
      return LoanModel(
          time: DateTime.now().toString(),
          reference: reference,
          amount: amount,exist: false);
    });
  }

//converts all loan items to list
  List<LoanModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }


  List<bool> get getRemitMapItems {
    return _remitMap!.entries.map((e) {
      return e.value;
    }).toList();
  }

  //sets the outstanding loans in a sharedpreference object
  void setOutstandingLoans() {
    loanRepo.setOutstandingLoan();
  }

//returns all the outstanding loans, by subtracting the remitted items
  int getOutstandingLoans() {
    return loanRepo.getOutstandingLoan();
  }

//converts all the items stored in the map containing remits to list
  List<LoanModel> get getRemitItems {
    return _remitItems.entries.map((e) {
      return e.value;
    }).toList();
  }

//get all loan history of the user
  List<LoanModel> getLoanHistory() {
    return loanRepo.getLoanHistory();
  }

  //gets the history of all the remited loans
  List<LoanModel> getRemitHistory() {
    return loanRepo.getRemitHistory();
  }

//gets the loan response from database either an approval or error message
  Future<LoanApplicationResponse> loanApplication(Loan application) async {
    _isLoading=true;
    update();
    print('before'+_isLoading.toString());
    await Future.delayed(Duration(seconds: 3));
    Response response = await loanRepo.loanApplication(application);
    late Loan loanApplication;
    if (response.statusCode == 201) {
      _isLoading=false;
      update();
      print('after'+_isLoading.toString());
      print(response.body);
      return LoanApplicationResponse(
          response.body["approved"], [], response.body["reference"], []);
    } else {
      _isLoading=false;
      update();
      print(response.statusCode);
      print(response.body);

      return LoanApplicationResponse(
          false,
          List<String>.from(response.body["errors"]),
          response.body["reference"], []);
    }
  }


}
