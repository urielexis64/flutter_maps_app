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

  // Map Controller
  late GoogleMapController _mapController;

  //Polylines
  Polyline _myRoute = Polyline(polylineId: PolylineId('myRoute'), width: 5);

  void initMap(GoogleMapController controller) {
    if (!state.loadedMap) {
      this._mapController = controller;

      this._mapController.setMapStyle(jsonEncode(colliersCanadaMap));

      add(OnLoadedMap());
    }
  }

  void moveCamera(LatLng destination) {
    final cameraUpdate = CameraUpdate.newLatLng(destination);
    this._mapController.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is OnLoadedMap) {
      yield state.copyWith(loadedMap: true);
    } else if (event is OnLocationUpdate) {
      List<LatLng> points = [...this._myRoute.points, event.location];
      this._myRoute = this._myRoute.copyWith(pointsParam: points);

      final currentPolylines = state.polylines;
      currentPolylines['myRoute'] = this._myRoute;

      yield state.copyWith(polylines: currentPolylines);
    }
  }
}
