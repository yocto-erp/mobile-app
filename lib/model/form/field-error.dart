class FieldError {
  String name;
  String code;
  String message;

  FieldError({this.name, this.code, this.message});

  FieldError.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
