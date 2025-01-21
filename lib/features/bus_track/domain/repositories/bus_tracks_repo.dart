import 'package:dartz/dartz.dart';
import 'package:elm_task/core/error/failures.dart';
import 'package:elm_task/features/bus_track/domain/entities/bus_track.dart';

abstract class BusTracksRepo {
  Future<Either<Failure, BusTracks>> getAll();
}
