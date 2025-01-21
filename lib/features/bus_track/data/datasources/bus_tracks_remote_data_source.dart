import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/network/endpoints.dart';
import 'package:elm_task/core/network/network.dart';
import 'package:elm_task/features/bus_track/data/models/bus_tracks_model.dart';

abstract class BusTracksRemoteDataSource {
  Future<BusTracksModel> getAll();
}

class BusTracksRemoteDataSourceImp implements BusTracksRemoteDataSource {
  final NetworkInterface network;

  BusTracksRemoteDataSourceImp({required this.network});

  @override
  Future<BusTracksModel> getAll() async {
    final response = await network.get(Endpoints.busTrack, {});
    if (response.statusCode == 200) {
      return BusTracksModel.fromJson(response.data);
    }
    throw ServerException();
  }
}
