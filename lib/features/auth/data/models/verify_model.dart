import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/auth/domain/entities/verify.dart';

class VerifyModel extends Verify {
  const VerifyModel({
    required super.roles,
    required super.token,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    try {
      return VerifyModel(
        roles: (json['roles'] as List<dynamic>)
            .map((e) => e.toString().toInt)
            .toList(),
        token: json['token'],
      );
    } catch (e) {
      throw SerializeException();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    data['token'] = this.token;
    return data;
  }
}
