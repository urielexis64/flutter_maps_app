part of 'map_bloc.dart';

@immutable
class MapState {
  final bool loadedMap;
  final bool drawPath;
  final bool followLocation;

  final Map<String, Polyline> polylines;
  final LatLng? centralLocation;

  MapState(
      {this.loadedMap = false,
      this.drawPath = true,
      this.followLocation = false,
      this.centralLocation,
      Map<String, Polyline>? polylines})
      : this.polylines = polylines ?? Map();

  MapState copyWith(
          {bool? loadedMap,
          bool? drawPath,
          bool? followLocation,
          LatLng? centralLocation,
          Map<String, Polyline>? polylines}) =>
      MapState(
          loadedMap: loadedMap ?? this.loadedMap,
          polylines: polylines ?? this.polylines,
          drawPath: drawPath ?? this.drawPath,
          followLocation: followLocation ?? this.followLocation,
          centralLocation: centralLocation ?? this.centralLocation);
}
