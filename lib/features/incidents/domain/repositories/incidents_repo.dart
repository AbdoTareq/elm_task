import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/entities/incs_status.dart';

abstract class IncidentsRepo {
  Future<Either<Failure, IncidentsWrapper>> getAll();
  Future<Either<Failure, IncidentsWrapper>> create(IncidentModel incidentModel);
  Future<Either<Failure, Incident>> changeStatus(
    String id,
    IncidentStatus status,
  );

  Future<Either<Failure, IncsStatus>> getIncidentsReport();
}
