import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps_app/bloc/map/map_bloc.dart';
import 'package:flutter_maps_app/bloc/my_location/my_location_bloc.dart';
import 'package:flutter_maps_app/bloc/search/search_bloc.dart';
import 'package:flutter_maps_app/helpers/helpers.dart';
import 'package:flutter_maps_app/models/search_result.dart';
import 'package:flutter_maps_app/search/search_destination.dart';
import 'package:flutter_maps_app/services/traffic_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as Poly;
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_button.dart';
part 'my_route_button.dart';
part 'follow_location_button.dart';
part 'searchbar.dart';
part 'manual_marker.dart';
