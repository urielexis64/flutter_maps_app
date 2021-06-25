part of 'map_bloc.dart';

@immutable
class MapState {
  final bool loadedMap;
  final bool drawPath;

  final Map<String, Polyline> polylines;

  MapState(
      {this.loadedMap = false,
      this.drawPath = true,
      Map<String, Polyline>? polylines})
      : this.polylines = polylines ?? Map();

  MapState copyWith(
          {bool? loadedMap,
          bool? drawPath,
          Map<String, Polyline>? polylines}) =>
      MapState(
          loadedMap: loadedMap ?? this.loadedMap,
          polylines: polylines ?? this.polylines,
          drawPath: drawPath ?? this.drawPath);
}
