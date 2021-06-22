import 'package:flutter/material.dart';
import 'package:flutter_maps_app/helpers/helpers.dart';
import 'package:flutter_maps_app/pages/gps_access.dart';
import 'package:flutter_maps_app/pages/map_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget with WidgetsBindingObserver {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print(state);
    if (state == AppLifecycleState.resumed &&
        await Geolocator.isLocationServiceEnabled()) {
      Navigator.pushReplacement(context, navigateFadeInMap(context, MapPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: FutureBuilder(
          future: checkGPS(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(snapshot.data),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          },
        ),
      ),
    );
  }

  Future checkGPS() async {
    // TODO: GPS Permission
    final gpsPermission = await Permission.location.isGranted;
    // TODO: GPS is active
    final gpsIsActive = await Geolocator.isLocationServiceEnabled();

    if (gpsPermission && gpsIsActive) {
      Navigator.pushReplacement(context, navigateFadeInMap(context, MapPage()));
      return '';
    } else if (!gpsPermission) {
      Navigator.pushReplacement(
          context, navigateFadeInMap(context, GpsAccessPage()));
    } else {
      return 'You need to activate your GPS.';
    }
  }
}
