import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/core/network/network_info.dart';
import 'package:elm_task/features/incidents/data/datasources/incidents_local_data_source.dart';
import 'package:elm_task/features/incidents/data/datasources/incidents_remote_data_source.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/entities/incs_status.dart';
import 'package:elm_task/features/incidents/domain/repositories/incidents_repo.dart';

class IncidentsRepoImp implements IncidentsRepo {
  final IncidentsRemoteDataSource remoteDataSource;
  final IncidentsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  IncidentsRepoImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, IncidentsWrapper>> getAll() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getAll();
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(message: 'server failure', data: null));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }

  @override
  Future<Either<Failure, IncidentsWrapper>> create(
      IncidentModel incidentModel) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.create(incidentModel);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(message: 'server failure', data: null));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }

  @override
  Future<Either<Failure, Incident>> changeStatus(
      String id, IncidentStatus status) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.changeStatus(id, status);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(message: 'server failure', data: null));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }

  @override
  Future<Either<Failure, IncsStatus>> getIncidentsReport() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getIncidentsReport();
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(message: 'server failure', data: null));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }
}
