import 'package:dartz/dartz.dart';
import 'package:elm_task/features/auth/domain/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class LoginAuth implements UseCase<bool, Params> {
  final AuthRepo repository;

  LoginAuth(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.login(params.email);
  }
}

class Params extends Equatable {
  final String email;

  const Params({required this.email});

  @override
  List<Object> get props => [email];
}
