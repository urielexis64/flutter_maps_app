part of 'my_location_bloc.dart';

@immutable
abstract class MyLocationEvent {}

class OnChangeLocation extends MyLocationEvent {
  final LatLng latLng;

  OnChangeLocation(this.latLng);
}
