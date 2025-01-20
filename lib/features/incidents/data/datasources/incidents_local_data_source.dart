import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/auth/data/models/verify_model.dart';

abstract class AuthLocalDataSource {
  Future<VerifyModel> getVerify(String email, String otp);
  Future<void> saveVerify(VerifyModel verify);
}

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final LocalDataSource localDataSource;

  AuthLocalDataSourceImp({required this.localDataSource});

  @override
  Future<VerifyModel> getVerify(String email, String otp) async {
    final json = await localDataSource.read(kVerify);
    if (json != null) {
      return VerifyModel.fromJson(json);
    }
    throw EmptyCacheException();
  }

  @override
  Future<void> saveVerify(VerifyModel verify) async {
    return await localDataSource.write(kVerify, verify.toJson());
  }
}
