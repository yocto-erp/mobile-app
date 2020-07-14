import 'package:mobile/model/user.dart';

class LoginResponse {
  String token;
  User user;

  LoginResponse({this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (user != null) {
      data['user'] = this.user;
    }
    return data;
  }
}
