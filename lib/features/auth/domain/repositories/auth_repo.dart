import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/features/auth/domain/entities/verify.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> login(String email);
  Future<Either<Failure, Verify>> verifyOtp(String email, String otp);
}
