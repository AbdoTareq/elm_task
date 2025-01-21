import 'package:elm_task/core/usecases/usecase.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/incidents/domain/entities/incidents_wrapper.dart';
import 'package:elm_task/features/incidents/domain/usecases/change_status_incident_usecase.dart';
import 'package:elm_task/features/incidents/domain/usecases/create_incident_usecase.dart';
import 'package:elm_task/features/incidents/domain/usecases/get_all_incidents_usecase.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_event.dart';
import 'package:elm_task/features/incidents/presentation/bloc/incidents_state.dart';

class IncidentsBloc extends Bloc<IncidentsEvent, IncidentsState> {
  final CreateIncidentUsecase createIncidentUsecase;
  final GetAllIncidentsUsecase getAllIncidentsUsecase;
  final ChangeStatusIncidentUsecase changeStatusIncidentUsecase;

  IncidentsBloc({
    required this.createIncidentUsecase,
    required this.getAllIncidentsUsecase,
    required this.changeStatusIncidentUsecase,
  }) : super(IncidentsEmpty()) {
    on<GetAllIncidentsEvent>(_getAllIncidents);
    on<CreateIncidentEvent>(_createIncident);
    on<ChangeStatusIncidentEvent>(_changeStatusIncident);
    on<GetIncidentsByStatusEvent>(_getIncidentsByStatus);
    on<GetIncidentsByDateEvent>(_getIncidentsByDate);
  }
  IncidentsWrapper allIncidents = IncidentsWrapper(incidents: []);
  Future<void> _getAllIncidents(
      GetAllIncidentsEvent event, Emitter<IncidentsState> emit) async {
    emit(IncidentsLoading());
    final result = await getAllIncidentsUsecase(NoParams());
    result.fold(
      (failure) => emit(IncidentsError(message: failure.message)),
      (success) {
        allIncidents = success;
        emit(IncidentsSuccess(incidentsWrapper: success));
      },
    );
  }

  Future<void> _getIncidentsByStatus(
      GetIncidentsByStatusEvent event, Emitter<IncidentsState> emit) async {
    emit(IncidentsLoading());
    List<Incident> filteredIncidents = allIncidents.incidents
        .where((element) => element.status == event.status)
        .toList();
    emit(IncidentsSuccess(
        incidentsWrapper: IncidentsWrapper(incidents: filteredIncidents)));
  }

  Future<void> _getIncidentsByDate(
      GetIncidentsByDateEvent event, Emitter<IncidentsState> emit) async {
    emit(IncidentsLoading());
    List<Incident> filteredIncidents = allIncidents.incidents
        .where((element) => element.createdAt.isAfter(event.date))
        .toList();
    Logger().i(allIncidents.incidents.first.createdAt);
    Logger().i(filteredIncidents.length);
    emit(IncidentsSuccess(
        incidentsWrapper: IncidentsWrapper(incidents: filteredIncidents)));
  }

  Future<void> _createIncident(
      CreateIncidentEvent event, Emitter<IncidentsState> emit) async {
    emit(IncidentsCreateLoading());
    final result = await createIncidentUsecase(event.item);
    result.fold(
      (failure) => emit(IncidentsCreateError(message: failure.message)),
      (success) => emit(IncidentsCreateSuccess(incidentsWrapper: success)),
    );
  }

  Future<void> _changeStatusIncident(
      ChangeStatusIncidentEvent event, Emitter<IncidentsState> emit) async {
    emit(IncidentsStatusChangeLoading(id: event.id));
    final result = await changeStatusIncidentUsecase(
      ChangeStatusIncidentParams(id: event.id, status: event.status),
    );
    result.fold(
      (failure) => emit(IncidentsStatusChangeError(message: failure.message)),
      (success) => emit(IncidentsStatusChangeSuccess(incident: success)),
    );
  }
}
