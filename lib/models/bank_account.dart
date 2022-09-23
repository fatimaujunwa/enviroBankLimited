import 'loan_application_model.dart';

class BankAccountModel {
  int? amount;
  BankAccount? bankAccount;
  String? collectionDate;
  String? firstName;
  int? idNumber;
  String? lastName;

  BankAccountModel(
      {this.amount,
        this.bankAccount,
        this.collectionDate,
        this.firstName,
        this.idNumber,
        this.lastName});

  BankAccountModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    bankAccount = json['bankAccount'] != null
        ? new BankAccount.fromJson(json['bankAccount'])
        : null;
    collectionDate = json['collectionDate'];
    firstName = json['firstName'];
    idNumber = json['idNumber'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    if (this.bankAccount != null) {
      data['bankAccount'] = this.bankAccount!.toJson();
    }
    data['collectionDate'] = this.collectionDate;
    data['firstName'] = this.firstName;
    data['idNumber'] = this.idNumber;
    data['lastName'] = this.lastName;
    return data;
  }
}