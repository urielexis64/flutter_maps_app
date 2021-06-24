import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_maps_app/themes/colliers_canada_map.dart';
import 'package:flutter_maps_app/themes/uber_map.dart';
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

      this._mapController.setMapStyle(jsonEncode(colliersCanadaMap));

      add(OnLoadedMap());
    }
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is OnLoadedMap) {
      yield state.copyWith(loadedMap: true);
    }
  }
}
