import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';

class IncidentsModel extends IncidentsWrapper {
  const IncidentsModel({
    required super.incidents,
  });

  factory IncidentsModel.fromJson(Map<String, dynamic> json) => IncidentsModel(
        incidents: List<Incident>.from(
            json["incidents"].map((x) => IncidentsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'incidents': incidents,
      };
}

class IncidentModel extends Incident {
  IncidentModel({
    required super.id,
    required super.description,
    required super.latitude,
    required super.longitude,
    required super.status,
    required super.priority,
    required super.typeId,
    required super.issuerId,
    required super.assigneeId,
    required super.createdAt,
    required super.updatedAt,
    required super.medias,
  });

  factory IncidentModel.fromJson(Map<String, dynamic> json) => IncidentModel(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        priority: json["priority"],
        typeId: json["type_id"],
        issuerId: json["issuer_id"],
        assigneeId: json["assignee_id"],
        medias:
            List<Media>.from(json["medias"].map((x) => MediaModel.fromJson(x))),
      );
}

class MediaModel extends Media {
  MediaModel({
    required super.id,
    required super.url,
    required super.type,
    required super.mimeType,
    required super.incidentId,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json["id"],
        url: json["url"],
        type: json["type"],
        mimeType: json["mime_type"],
        incidentId: json["incident_id"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'type': type,
        'mime_type': mimeType,
        'incident_id': incidentId,
      };
}
