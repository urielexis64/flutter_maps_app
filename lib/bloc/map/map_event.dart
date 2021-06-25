part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnLoadedMap extends MapEvent {}

class OnLocationUpdate extends MapEvent {
  final LatLng location;

  OnLocationUpdate(this.location);
}
