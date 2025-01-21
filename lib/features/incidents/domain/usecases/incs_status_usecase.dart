import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/core/usecases/usecase.dart';
import 'package:elm_task/features/incidents/domain/entities/incs_status.dart';
import 'package:elm_task/features/incidents/domain/repositories/incidents_repo.dart';

class GetIncsStatusUsecase implements UseCase<IncsStatus, NoParams> {
  final IncidentsRepo repository;

  GetIncsStatusUsecase(this.repository);

  @override
  Future<Either<Failure, IncsStatus>> call(NoParams params) async {
    return await repository.getIncidentsReport();
  }
}
