import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BusTracksEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllBusTracksEvent extends BusTracksEvent {}
