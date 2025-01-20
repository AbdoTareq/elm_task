import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/network/network.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';

abstract class IncidentsRemoteDataSource {
  Future<IncidentsModel> getAll();
  Future<IncidentsModel> create(IncidentModel item);
  Future<IncidentModel> changeStatus(String id, IncidentStatus status);
}

class IncidentsRemoteDataSourceImp implements IncidentsRemoteDataSource {
  final NetworkInterface network;

  IncidentsRemoteDataSourceImp({required this.network});

  @override
  Future<IncidentsModel> getAll() async {
    final response = await network.get('/incident?startDate=2021-11-14', {});
    if (response.statusCode == 200) {
      return IncidentsModel.fromJson(response.data);
    }
    throw ServerException();
  }

  @override
  Future<IncidentModel> changeStatus(String id, IncidentStatus status) async {
    final response = await network.put('incident/change-status', {
      "incidentId": id,
      "status": status.index,
    });
    if (response.statusCode == 200) {
      return IncidentModel.fromJson(response.data);
    }
    throw ServerException();
  }

  @override
  Future<IncidentsModel> create(IncidentModel item) async {
    final response =
        await network.post('incident/change-status', item.toJson());
    if (response.statusCode == 200) {
      return IncidentsModel.fromJson(response.data);
    }
    throw ServerException();
  }
}
