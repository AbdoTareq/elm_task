import 'package:elm_task/features/incidents/domain/entities/incidents_status.dart';

class IncidentsStatusModel extends IncsStatus {
  IncidentsStatusModel({
    required super.incidents,
  });

  factory IncidentsStatusModel.fromMap(Map<String, dynamic> json) =>
      IncidentsStatusModel(
        incidents: List<IncCountModel>.from(
            json["incidents"].map((x) => IncCountModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "incidents": List<dynamic>.from(incidents.map((x) => {
              "status": x.status,
              "_count": {
                "status": x.count.status,
              },
            })),
      };
}

class IncCountModel extends IncCount {
  IncCountModel({
    required super.status,
    required super.count,
  });

  factory IncCountModel.fromMap(Map<String, dynamic> json) => IncCountModel(
        status: json["status"],
        count: CountModel.fromMap(json["_count"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "_count": {
          "status": count.status,
        },
      };
}

class CountModel extends Count {
  CountModel({
    required super.status,
  });

  factory CountModel.fromMap(Map<String, dynamic> json) => CountModel(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
      };
}
