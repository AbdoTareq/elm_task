import 'package:equatable/equatable.dart';

class IncidentsWrapper extends Equatable {
  final List<Incident> incidents;

  const IncidentsWrapper({
    required this.incidents,
  });

  @override
  List<Object?> get props => [incidents];
}

enum IncidentStatus {
  submitted,
  inProgress,
  completed,
  rejected,
}

class Incident {
  final String id;
  final String description;
  final num latitude;
  final num longitude;
  final IncidentStatus status;
  final num priority;
  final num typeId;
  final String issuerId;
  final String assigneeId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Media> medias;

  Incident({
    required this.id,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.priority,
    required this.typeId,
    required this.issuerId,
    required this.assigneeId,
    required this.createdAt,
    required this.updatedAt,
    required this.medias,
  });
}

class Media {
  final String id;
  final String mimeType;
  final String url;
  final num type;
  final String incidentId;

  Media({
    required this.id,
    required this.mimeType,
    required this.url,
    required this.type,
    required this.incidentId,
  });
}
