import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class IncidentsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllIncidentsEvent extends IncidentsEvent {}

class GetIncsStatusEvent extends IncidentsEvent {}

class GetIncidentsByStatusEvent extends IncidentsEvent {
  final IncidentStatus status;

  GetIncidentsByStatusEvent(this.status);
}

class GetIncidentsByDateEvent extends IncidentsEvent {
  final DateTime date;

  GetIncidentsByDateEvent(this.date);
}

class CreateIncidentEvent extends IncidentsEvent {
  final IncidentModel item;

  CreateIncidentEvent(this.item);

  @override
  List<Object> get props => [item];
}

class ChangeStatusIncidentEvent extends IncidentsEvent {
  final String id;
  final IncidentStatus status;

  ChangeStatusIncidentEvent(this.id, this.status);

  @override
  List<Object> get props => [id, status];
}
