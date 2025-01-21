import 'package:elm_task/core/usecases/usecase.dart';
import 'package:elm_task/export.dart';
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
  }

  Future<void> _getAllIncidents(
      GetAllIncidentsEvent event, Emitter<IncidentsState> emit) async {
    emit(IncidentsLoading());
    final result = await getAllIncidentsUsecase(NoParams());
    result.fold(
      (failure) => emit(IncidentsError(message: failure.message)),
      (success) => emit(IncidentsSuccess(incidentsWrapper: success)),
    );
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
