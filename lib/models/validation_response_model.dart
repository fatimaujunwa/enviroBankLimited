class ValidationResponse {
  List<String>? _errors;
  bool? _success;
  List<String>? _warnings;

  ValidationResponse(this._errors, this._success, this._warnings);
bool? get success=>_success;
  List<String>? get errors=>_errors;
  List<String>? get warnings=>_warnings;
  ValidationResponse.fromJson(Map<String, dynamic> json) {
    _errors = json['errors'].cast<String>();
    _success = json['success'];
    _warnings = json['warnings'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this._errors;
    data['success'] = this._success;
    data['warnings'] = this._warnings;
    return data;
  }


}