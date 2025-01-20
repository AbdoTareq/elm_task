import 'package:dartz/dartz.dart';
import 'package:elm_task/features/auth/domain/entities/verify.dart';
import 'package:elm_task/features/auth/domain/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class VerifyUsecase implements UseCase<Verify, VerifyParams> {
  final AuthRepo repository;

  VerifyUsecase(this.repository);

  @override
  Future<Either<Failure, Verify>> call(VerifyParams params) async {
    return await repository.verifyOtp(params.email, params.otp);
  }
}

class VerifyParams extends Equatable {
  final String email;
  final String otp;

  const VerifyParams({
    required this.email,
    required this.otp,
  });

  @override
  List<Object> get props => [email];
}
