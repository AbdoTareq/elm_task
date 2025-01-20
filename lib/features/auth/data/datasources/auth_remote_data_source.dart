import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/core/network/network.dart';
import 'package:elm_task/core/network/server_response.dart';
import 'package:elm_task/features/auth/data/models/verify_model.dart';

abstract class AuthRemoteDataSource {
  Future<bool> login(String email);
  Future<VerifyModel> verifyOtp(String email, String otp);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final NetworkInterface network;

  AuthRemoteDataSourceImp({required this.network});

  @override
  Future<bool> login(String email) async {
    final response = await network.post('/login', {'email': email});
    if (response.statusCode == 200) {
      return true;
    }
    throw ServerException();
  }

  @override
  Future<VerifyModel> verifyOtp(String email, String otp) async {
    final response =
        await network.post('/verify-otp', {'email': email, 'otp': otp});
    if (response.statusCode == 200) {
      return VerifyModel.fromJson(response.data);
    }
    throw ServerException();
  }
}
