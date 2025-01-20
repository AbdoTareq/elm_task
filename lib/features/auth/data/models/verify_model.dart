import 'package:elm_task/features/auth/domain/entities/verify.dart';

class VerifyModel extends Verify {
  const VerifyModel({
    required super.roles,
    required super.token,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(
      roles: json['roles'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    data['token'] = this.token;
    return data;
  }
}
