part of 'my_location_bloc.dart';

@immutable
class MyLocationState {
  final bool tracking;
  final bool locationExists;
  final LatLng location;

  MyLocationState(
      {this.tracking = true,
      this.locationExists = false,
      this.location = const LatLng(0, 0)});

  MyLocationState copyWith(
          {bool? following, bool? locationExists, LatLng? location}) =>
      MyLocationState(
        tracking: following ?? this.tracking,
        locationExists: locationExists ?? this.locationExists,
        location: location ?? this.location,
      );
}
