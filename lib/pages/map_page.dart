import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/bloc/my_location/my_location_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    BlocProvider.of<MyLocationBloc>(context).startTracking();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<MyLocationBloc>(context).cancelTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MyLocationBloc, MyLocationState>(
        builder: (context, state) => createMap(state),
      ),
    );
  }

  Widget createMap(MyLocationState state) {
    if (!state.locationExists) {
      return Center(
        child: Column(
          children: [Text('Getting location...'), CircularProgressIndicator()],
        ),
      );
    }
    final cameraPosition = CameraPosition(target: state.location, zoom: 20);
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
  }
}
