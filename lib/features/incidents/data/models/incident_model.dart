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
        id: json["id"] ?? "",
        description: json["description"] ?? "",
        status: IncidentStatus.values[json["status"] ?? 0],
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
        latitude: json["latitude"] ?? 0.0,
        longitude: json["longitude"] ?? 0.0,
        priority: json["priority"] ?? 0,
        typeId: json["type_id"] ?? 0,
        issuerId: json["issuer_id"] ?? "",
        assigneeId: json["assignee_id"] ?? "",
        medias: List<Media>.from(
            (json["medias"] ?? []).map((x) => MediaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "status": status.index,
        "typeId": typeId,
        "priority": priority,
        "issuerId": issuerId,
      };
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
