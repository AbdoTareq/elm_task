import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/incidents/data/models/incident_model.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';

abstract class IncidentsLocalDataSource {
  Future<IncidentsModel> getAll();
  Future<void> save(IncidentsModel incidentsModel);
}

class IncidentsLocalDataSourceImp implements IncidentsLocalDataSource {
  final LocalDataSource localDataSource;

  IncidentsLocalDataSourceImp({required this.localDataSource});

  @override
  Future<IncidentsModel> getAll() async {
    final data = await localDataSource.read(kIncidents);
    if (data == null) {
      throw EmptyCacheException();
    }
    return IncidentsModel.fromJson(data);
  }

  @override
  Future<void> save(IncidentsModel incidentsModel) async {
    await localDataSource.write(kIncidents, incidentsModel.toJson());
  }
}
