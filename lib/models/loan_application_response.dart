class LoanApplicationResponse {
  bool? _approved;
  List<String>? _errors;
  String? _reference;
  List<String>? _warnings;

  LoanApplicationResponse(
      this._approved, this._errors, this._reference, this._warnings);
  List<String>? get warnings=>_warnings;
  List<String>? get errors=>_errors;
  String? get reference=>_reference;
  bool? get approved=>_approved;

  LoanApplicationResponse.fromJson(Map<String, dynamic> json) {
    _approved = json['approved'];
    _errors = json['errors'].cast<String>();
    _reference = json['reference'];
    _warnings = json['warnings'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approved'] = this.approved;
    data['errors'] = this.errors;
    data['reference'] = this.reference;
    data['warnings'] = this.warnings;
    return data;
  }
}