import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/bloc/my_location/my_location_bloc.dart';
import 'package:flutter_maps_app/pages/gps_access.dart';
import 'package:flutter_maps_app/pages/loading_page.dart';
import 'package:flutter_maps_app/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MyLocationBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoadingPage(),
        routes: {
          'map': (_) => MapPage(),
          'loading': (_) => LoadingPage(),
          'gps_access': (_) => GpsAccessPage(),
        },
      ),
    );
  }
}
