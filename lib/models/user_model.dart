class User {
  String? emailAddress;
  String? password;

  User({this.emailAddress, this.password});

  User.fromJson(Map<String, dynamic> json) {
    emailAddress = json['emailAddress'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailAddress'] = this.emailAddress;
    data['password'] = this.password;
    return data;
  }
}

