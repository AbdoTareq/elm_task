class BusTracks {
  final List<Track> tracks;

  BusTracks({required this.tracks});
}

class Track {
  final double trackingLongitude;
  final double trackingLatitude;
  final DateTime trackingTime;
  final String busNumber;
  final String assignedWorkerId;
  final String trackingId;

  Track(
      {required this.trackingLongitude,
      required this.trackingLatitude,
      required this.assignedWorkerId,
      required this.trackingTime,
      required this.trackingId,
      required this.busNumber});
}
