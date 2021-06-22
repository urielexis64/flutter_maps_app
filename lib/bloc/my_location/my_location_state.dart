part of 'my_location_bloc.dart';

@immutable
class MyLocationState {
  final bool following;
  final bool locationExists;
  final LatLng? location;

  MyLocationState(
      {this.following = true, this.locationExists = false, this.location});

  MyLocationState copyWith(
          {bool? following, bool? locationExists, LatLng? location}) =>
      MyLocationState(
        following: following ?? this.following,
        locationExists: locationExists ?? this.locationExists,
        location: location ?? this.location,
      );
}
