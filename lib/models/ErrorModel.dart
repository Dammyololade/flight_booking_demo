///
/// project: flight_reservouir
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19
class ErrorModel {
  List<Errors> errors;

  ErrorModel({this.errors});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = new List<Errors>();
      json['errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  int code;
  String title;
  String detail;
  String status;

  Errors({this.code, this.title, this.detail, this.status});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    detail = json['detail'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['title'] = this.title;
    data['detail'] = this.detail;
    data['status'] = this.status;
    return data;
  }
}

