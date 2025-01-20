import 'package:dartz/dartz.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/repositories/incidents_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllIncidentsUsecase implements UseCase<IncidentsWrapper, NoParams> {
  final IncidentsRepo repository;

  GetAllIncidentsUsecase(this.repository);

  @override
  Future<Either<Failure, IncidentsWrapper>> call(NoParams params) async {
    return await repository.getAll();
  }
}
