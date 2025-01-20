import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/network/network.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';

abstract class IncidentsRemoteDataSource {
  Future<IncidentsModel> getAll();
  Future<IncidentsModel> filter({DateTime? startDate, String status = ""});
}

class IncidentsRemoteDataSourceImp implements IncidentsRemoteDataSource {
  final NetworkInterface network;

  IncidentsRemoteDataSourceImp({required this.network});

  @override
  Future<IncidentsModel> getAll() async {
    final response = await network.get('/incident', {});
    if (response.statusCode == 200) {
      return IncidentsModel.fromJson(response.data);
    }
    throw ServerException();
  }

  @override
  Future<IncidentsModel> filter({DateTime? startDate, String status = ""}) {
    // TODO: implement filter
    throw UnimplementedError();
  }
}
