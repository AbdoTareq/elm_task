import 'package:dartz/dartz.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';

import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/repositories/incidents_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class CreateIncidentUsecase
    implements UseCase<IncidentsWrapper, IncidentModel> {
  final IncidentsRepo repository;

  CreateIncidentUsecase(this.repository);

  @override
  Future<Either<Failure, IncidentsWrapper>> call(IncidentModel params) async {
    return await repository.create(params);
  }
}
