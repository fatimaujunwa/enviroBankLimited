class Loan {
  String? firstName;
  String? lastName;
  String? idNumber;
  BankAccount? bankAccount;
  String? amount;
  String? collectionDate;

  Loan(
      {this.firstName,
        this.lastName,
        this.idNumber,
        this.bankAccount,
        this.amount,
        this.collectionDate});

  Loan.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    idNumber = json['idNumber'];
    bankAccount = json['bankAccount'] != null
        ? new BankAccount.fromJson(json['bankAccount'])
        : null;
    amount = json['amount'];
    collectionDate = json['collectionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['idNumber'] = this.idNumber;
    if (this.bankAccount != null) {
      data['bankAccount'] = this.bankAccount!.toJson();
    }
    data['amount'] = this.amount;
    data['collectionDate'] = this.collectionDate;
    return data;
  }
}

class BankAccount {
  String? bankName;
  String? accountNumber;
  String? branchCode;

  BankAccount({this.bankName, this.accountNumber, this.branchCode});

  BankAccount.fromJson(Map<String, dynamic> json) {
    bankName = json['bankName'];
    accountNumber = json['accountNumber'];
    branchCode = json['branchCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankName'] = this.bankName;
    data['accountNumber'] = this.accountNumber;
    data['branchCode'] = this.branchCode;
    return data;
  }
}

