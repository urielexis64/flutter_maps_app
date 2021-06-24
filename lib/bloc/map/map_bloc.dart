import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState());

  late GoogleMapController _mapController;

  void initMap(GoogleMapController controller) {
    if (!state.loadedMap) {
      this._mapController = controller;
      add(OnLoadedMap());
    }
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is OnLoadedMap) {
      yield state.copyWith(loadedMap: true);
      print('llegooooo');
    }
  }
}
