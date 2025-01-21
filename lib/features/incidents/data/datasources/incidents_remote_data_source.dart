import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/network/endpoints.dart';
import 'package:elm_task/core/network/network.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/data/models/incidents_status_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_state.dart';

abstract class IncidentsRemoteDataSource {
  Future<IncidentsModel> getAll();
  Future<IncidentsModel> create(IncidentModel item);
  Future<IncidentModel> changeStatus(String id, IncidentStatus status);
  Future<IncidentsStatusModel> getIncidentsReport();
}

class IncidentsRemoteDataSourceImp implements IncidentsRemoteDataSource {
  final NetworkInterface network;

  IncidentsRemoteDataSourceImp({required this.network});

  @override
  Future<IncidentsModel> getAll() async {
    final response =
        await network.get('${Endpoints.incident}?startDate=2021-11-14', {});
    if (response.statusCode == 200) {
      return IncidentsModel.fromJson(response.data);
    }
    throw ServerException();
  }

  @override
  Future<IncidentModel> changeStatus(String id, IncidentStatus status) async {
    final response = await network.put('${Endpoints.incident}/change-status', {
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
    final response = await network.post(Endpoints.incident, item.toJson());
    if (response.statusCode == 200) {
      return IncidentsModel.fromJson(response.data);
    }
    throw ServerException();
  }

  @override
  Future<IncidentsStatusModel> getIncidentsReport() async {
    final response = await network.get(Endpoints.dashboard, {});
    if (response.statusCode == 200) {
      return IncidentsStatusModel.fromJson(response.data);
    }
    throw ServerException();
  }
}
