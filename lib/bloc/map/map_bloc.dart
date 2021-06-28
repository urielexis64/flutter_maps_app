import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_maps_app/themes/colliers_canada_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState());

  // Map Controller
  late GoogleMapController _mapController;

  //Polylines
  Polyline _myRoute = Polyline(
      polylineId: PolylineId('myRoute'), width: 5, color: Colors.black87);

  void initMap(GoogleMapController controller) {
    if (!state.loadedMap) {
      this._mapController = controller;

      this._mapController.setMapStyle(jsonEncode(colliersCanadaMap));

      add(OnLoadedMap());
    }
  }

  void moveCamera(LatLng destination) {
    final cameraUpdate = CameraUpdate.newLatLng(destination);
    this._mapController.moveCamera(cameraUpdate);
    // very slow animation
    //this._mapController.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if (event is OnLoadedMap) {
      yield state.copyWith(loadedMap: true);
    } else if (event is OnLocationUpdate) {
      yield* _onLocationUpdate(event);
    } else if (event is OnMarkRoute) {
      yield* _onMarkRoute(event);
    } else if (event is OnFollowLocation) {
      yield* _onFollowLocation(event);
    } else if (event is OnMapMoved) {
      yield state.copyWith(centralLocation: event.mapCenter);
    }
  }

  Stream<MapState> _onLocationUpdate(OnLocationUpdate event) async* {
    if (state.followLocation) {
      moveCamera(event.location);
    }

    final points = [...this._myRoute.points, event.location];
    this._myRoute = this._myRoute.copyWith(pointsParam: points);

    final currentPolylines = state.polylines;
    currentPolylines['myRoute'] = this._myRoute;

    yield state.copyWith(polylines: currentPolylines);
  }

  Stream<MapState> _onMarkRoute(OnMarkRoute event) async* {
    if (!state.drawPath) {
      this._myRoute = this._myRoute.copyWith(colorParam: Colors.black87);
    } else {
      this._myRoute = this._myRoute.copyWith(colorParam: Colors.transparent);
    }

    final currentPolylines = state.polylines;
    currentPolylines['myRoute'] = this._myRoute;

    yield state.copyWith(
        drawPath: !state.drawPath, polylines: currentPolylines);
  }

  Stream<MapState> _onFollowLocation(OnFollowLocation event) async* {
    if (!state.followLocation) {
      this.moveCamera(this._myRoute.points[this._myRoute.points.length - 1]);
    }
    yield state.copyWith(followLocation: !state.followLocation);
  }
}
