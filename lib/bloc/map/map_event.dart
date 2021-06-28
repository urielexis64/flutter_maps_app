part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnLoadedMap extends MapEvent {}

class OnMarkRoute extends MapEvent {}

class OnMapMoved extends MapEvent {
  final LatLng mapCenter;

  OnMapMoved(this.mapCenter);
}

class OnFollowLocation extends MapEvent {}

class OnLocationUpdate extends MapEvent {
  final LatLng location;

  OnLocationUpdate(this.location);
}
