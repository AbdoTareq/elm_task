import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/entities/incs_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IncidentsState extends Equatable {
  @override
  List<Object> get props => [];
}

// incidents
class IncidentsEmpty extends IncidentsState {}

class IncidentsLoading extends IncidentsState {}

class IncidentsError extends IncidentsState {
  final String message;

  IncidentsError({required this.message});

  @override
  List<Object> get props => [message];
}

class IncidentsSuccess extends IncidentsState {
  final IncidentsWrapper incidentsWrapper;

  IncidentsSuccess({required this.incidentsWrapper});

  @override
  List<Object> get props => [incidentsWrapper];
}

// create
class IncidentsCreateEmpty extends IncidentsState {}

class IncidentsCreateLoading extends IncidentsState {}

class IncidentsCreateError extends IncidentsState {
  final String message;

  IncidentsCreateError({required this.message});

  @override
  List<Object> get props => [message];
}

class IncidentsCreateSuccess extends IncidentsState {
  final IncidentsWrapper incidentsWrapper;

  IncidentsCreateSuccess({required this.incidentsWrapper});

  @override
  List<Object> get props => [incidentsWrapper];
}

// status change
class IncidentsStatusChangeEmpty extends IncidentsState {}

class IncidentsStatusChangeLoading extends IncidentsState {
  final String id;

  IncidentsStatusChangeLoading({required this.id});
}

class IncidentsStatusChangeError extends IncidentsState {
  final String message;

  IncidentsStatusChangeError({required this.message});

  @override
  List<Object> get props => [message];
}

class IncidentsStatusChangeSuccess extends IncidentsState {
  final Incident incident;

  IncidentsStatusChangeSuccess({required this.incident});

  @override
  List<Object> get props => [incident];
}

// incs Status report
class IncsStatusEmpty extends IncidentsState {}

class IncsStatusLoading extends IncidentsState {}

class IncsStatusError extends IncidentsState {
  final String message;

  IncsStatusError({required this.message});

  @override
  List<Object> get props => [message];
}

class IncsStatusSuccess extends IncidentsState {
  final IncsStatus incsStatus;

  IncsStatusSuccess({required this.incsStatus});

  @override
  List<Object> get props => [incsStatus];
}
