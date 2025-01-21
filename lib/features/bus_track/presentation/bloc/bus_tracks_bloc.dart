import 'package:elm_task/core/usecases/usecase.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/bus_track/domain/usecases/get_all_incidents_usecase.dart';
import 'package:elm_task/features/bus_track/presentation/bloc/bus_tracks_event.dart';
import 'package:elm_task/features/bus_track/presentation/bloc/bus_tracks_state.dart';

class BusTracksBloc extends Bloc<BusTracksEvent, BusTracksState> {
  final GetBusTracksUsecase getAllBusTracksUsecase;

  BusTracksBloc({
    required this.getAllBusTracksUsecase,
  }) : super(BusTracksEmpty()) {
    on<GetAllBusTracksEvent>(_getAllBusTracks);
  }
  Future<void> _getAllBusTracks(
      GetAllBusTracksEvent event, Emitter<BusTracksState> emit) async {
    emit(BusTracksLoading());
    final result = await getAllBusTracksUsecase(NoParams());
    result.fold(
      (failure) => emit(BusTracksError(message: failure.message)),
      (success) {
        emit(BusTracksSuccess(busTracks: success));
      },
    );
  }
}
