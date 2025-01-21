import 'package:elm_task/features/bus_track/domain/entities/bus_track.dart';

class BusTracksModel extends BusTracks {
  BusTracksModel({required super.tracks});

  factory BusTracksModel.fromJson(json) => BusTracksModel(
      tracks: List<TrackModel>.from(
          ((json ?? []) as List).map((x) => TrackModel.fromJson(x))));
}

class TrackModel extends Track {
  TrackModel(
      {required super.trackingLongitude,
      required super.trackingLatitude,
      required super.trackingTime,
      required super.busNumber,
      required super.assignedWorkerId,
      required super.trackingId});

  factory TrackModel.fromJson(Map<String, dynamic> json) => TrackModel(
      trackingLongitude: json['TrackingLongitude'] ?? 0,
      trackingLatitude: json['TrackingLatitude'] ?? 0,
      trackingTime:
          DateTime.parse(json['TrackingTime'] ?? DateTime.now().toString()),
      trackingId: json['TrackingId'],
      assignedWorkerId: json['AssigedWorkerId'] ?? '',
      busNumber: json['busNumber'] ?? '');
}
