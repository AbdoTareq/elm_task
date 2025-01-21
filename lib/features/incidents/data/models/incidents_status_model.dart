import 'package:elm_task/features/incidents/domain/entities/incs_status.dart';

class IncidentsStatusModel extends IncsStatus {
  IncidentsStatusModel({
    required super.incidents,
  });

  factory IncidentsStatusModel.fromJson(Map<String, dynamic> json) =>
      IncidentsStatusModel(
        incidents: List<IncCountModel>.from(
            json["incidents"].map((x) => IncCountModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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

  factory IncCountModel.fromJson(Map<String, dynamic> json) => IncCountModel(
        status: json["status"],
        count: CountModel.fromJson(json["_count"]),
      );

  Map<String, dynamic> toJson() => {
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

  factory CountModel.fromJson(Map<String, dynamic> json) => CountModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
