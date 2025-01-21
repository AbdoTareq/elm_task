import 'package:dartz/dartz.dart';
import 'package:elm_task/features/bus_track/domain/entities/bus_track.dart';
import 'package:elm_task/features/bus_track/domain/repositories/bus_tracks_repo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetBusTracksUsecase implements UseCase<BusTracks, NoParams> {
  final BusTracksRepo repository;

  GetBusTracksUsecase(this.repository);

  @override
  Future<Either<Failure, BusTracks>> call(NoParams params) async {
    return await repository.getAll();
  }
}
