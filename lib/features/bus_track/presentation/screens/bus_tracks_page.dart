import 'package:elm_task/export.dart';
import 'package:elm_task/features/bus_track/domain/entities/bus_track.dart';
import 'package:elm_task/features/bus_track/presentation/bloc/bus_tracks_bloc.dart';
import 'package:elm_task/features/bus_track/presentation/bloc/bus_tracks_event.dart';
import 'package:elm_task/features/bus_track/presentation/bloc/bus_tracks_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusTracksPage extends StatefulWidget {
  const BusTracksPage({super.key, required this.id});
  final String id;
  @override
  State<BusTracksPage> createState() => _BusTracksPageState();
}

class _BusTracksPageState extends State<BusTracksPage> {
  late BusTracksBloc busTracksBloc;
  final Set<Marker> markers = {};
  List<Track> list = [];
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    busTracksBloc = sl<BusTracksBloc>()..add(GetAllBusTracksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => busTracksBloc,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SafeArea(
            child: BlocBuilder<BusTracksBloc, BusTracksState>(
              builder: (context, state) {
                if (state is BusTracksLoading) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (state is BusTracksError) {
                  return Text(state.message);
                }
                if (state is BusTracksSuccess) {
                  list = state.busTracks.tracks;
                  for (var element in list) {
                    markers.add(Marker(
                      markerId: MarkerId(element.trackingId),
                      position: LatLng(
                          element.trackingLatitude, element.trackingLongitude),
                      icon: BitmapDescriptor.defaultMarker,
                    ));
                  }
                  mapController.moveCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(markers.first.position.latitude,
                          markers.first.position.longitude),
                      zoom: 15,
                    ),
                  ));
                  Future.delayed(Duration(milliseconds: 1800)).then((_) {
                    setState(() {});
                  });
                }
                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition:
                      const CameraPosition(target: LatLng(0, 0)),
                  onMapCreated: _onMapCreated,
                  minMaxZoomPreference: const MinMaxZoomPreference(0, 18),
                  markers: markers,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
