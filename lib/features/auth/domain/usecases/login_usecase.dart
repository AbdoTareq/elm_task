import 'package:dartz/dartz.dart';
import 'package:elm_task/features/auth/domain/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class LoginUsecase implements UseCase<bool, LoginParams> {
  final AuthRepo repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async {
    return await repository.login(params.email);
  }
}

class LoginParams extends Equatable {
  final String email;

  const LoginParams({required this.email});

  @override
  List<Object> get props => [email];
}
