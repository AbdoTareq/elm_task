import 'package:elm_task/features/bus_track/domain/entities/bus_track.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BusTracksState extends Equatable {
  @override
  List<Object> get props => [];
}

// busTracks
class BusTracksEmpty extends BusTracksState {}

class BusTracksLoading extends BusTracksState {}

class BusTracksError extends BusTracksState {
  final String message;

  BusTracksError({required this.message});

  @override
  List<Object> get props => [message];
}

class BusTracksSuccess extends BusTracksState {
  final BusTracks busTracks;

  BusTracksSuccess({required this.busTracks});

  @override
  List<Object> get props => [busTracks];
}
