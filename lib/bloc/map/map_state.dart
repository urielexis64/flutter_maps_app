part of 'map_bloc.dart';

@immutable
class MapState {
  final bool loadedMap;

  MapState({this.loadedMap = false});

  MapState copyWith({bool? loadedMap}) =>
      MapState(loadedMap: loadedMap ?? this.loadedMap);
}
