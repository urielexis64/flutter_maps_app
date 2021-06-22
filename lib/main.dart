import 'package:flutter/material.dart';
import 'package:flutter_maps_app/pages/gps_access.dart';
import 'package:flutter_maps_app/pages/loading_page.dart';
import 'package:flutter_maps_app/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoadingPage(),
      routes: {
        'map': (_) => MapPage(),
        'loading': (_) => LoadingPage(),
        'gps_access': (_) => GpsAccessPage(),
      },
    );
  }
}
