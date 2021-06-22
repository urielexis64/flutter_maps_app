import 'package:flutter/material.dart';
import 'package:flutter_maps_app/helpers/helpers.dart';
import 'package:flutter_maps_app/pages/gps_access.dart';
import 'package:flutter_maps_app/pages/map_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: FutureBuilder(
          future: checkGPS(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) => Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }

  Future checkGPS(context) async {
    // TODO: GPS Permission
    // TODO: GPS is active

    await Future.delayed(Duration(milliseconds: 800));
    Navigator.pushReplacement(
        context, navigateFadeInMap(context, GpsAccessPage()));
    //Navigator.pushReplacement(context, navigateFadeInMap(context, MapPage()));
  }
}
