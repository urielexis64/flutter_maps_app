import 'package:dio/dio.dart';
import 'package:flutter_maps_app/models/traffic_response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrafficService {
  // Singleton
  TrafficService._();

  static final TrafficService _instance = TrafficService._();

  factory TrafficService() => _instance;

  final _dio = Dio();
  final baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey =
      'pk.eyJ1IjoidXJpZWxleGlzNjQiLCJhIjoiY2txZzFod3MxMTd0ajJwbnZkNDdseTU4eSJ9.w8ben8ik_C9e-EKywH_FzQ';

  Future<DrivingResponse> getCoords(LatLng start, LatLng end) async {
    print(start);
    print(end);

    final coordString =
        '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$baseUrl/mapbox/driving/$coordString';

    final resp = await _dio.get(url, queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': 'false',
      'access_token': this._apiKey,
      'language': 'es'
    });

    final data = DrivingResponse.fromJson(resp.data);

    return data;
  }
}
