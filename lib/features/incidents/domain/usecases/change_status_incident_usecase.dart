import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/core/usecases/usecase.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/repositories/incidents_repo.dart';
import 'package:equatable/equatable.dart';

class ChangeStatusIncidentUsecase
    implements UseCase<Incident, ChangeStatusIncidentParams> {
  final IncidentsRepo repository;

  ChangeStatusIncidentUsecase(this.repository);

  @override
  Future<Either<Failure, Incident>> call(
      ChangeStatusIncidentParams params) async {
    return await repository.changeStatus(params.id, params.status);
  }
}

class ChangeStatusIncidentParams extends Equatable {
  final String id;
  final IncidentStatus status;

  const ChangeStatusIncidentParams({
    required this.id,
    required this.status,
  });

  @override
  List<Object> get props => [id, status];
}
