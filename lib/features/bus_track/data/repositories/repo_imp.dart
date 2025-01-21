import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/core/network/network_info.dart';
import 'package:elm_task/features/bus_track/data/datasources/bus_tracks_remote_data_source.dart';
import 'package:elm_task/features/bus_track/domain/entities/bus_track.dart';
import 'package:elm_task/features/bus_track/domain/repositories/bus_tracks_repo.dart';

class BusTracksRepoImp implements BusTracksRepo {
  final BusTracksRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BusTracksRepoImp({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, BusTracks>> getAll() async {
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
}
