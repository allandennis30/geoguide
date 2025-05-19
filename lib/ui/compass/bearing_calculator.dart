import 'dart:math';
import 'package:geoguide/services/location_service.dart';
import 'package:latlong2/latlong.dart';

class BearingCalculator {
  final LocationService locationService = LocationService();

  double _prevLat = double.nan;
  double _prevLon = double.nan;
  double compassBearing = 0.0;

  double degToRad(double deg) => deg * (pi / 180.0);
  double radToDeg(double rad) => rad * (180.0 / pi);

  Future<double> calculateTravelBearing() async {
    final pos = await locationService.getCurrentPosition();
    final lat = pos.latitude;
    final lon = pos.longitude;

    if (_prevLat.isNaN || _prevLon.isNaN) {
      _prevLat = lat;
      _prevLon = lon;
      return compassBearing;
    }

    final phi1 = degToRad(_prevLat);
    final phi2 = degToRad(lat);
    final deltaLon = degToRad(lon - _prevLon);

    final y = sin(deltaLon) * cos(phi2);
    final x = cos(phi1) * sin(phi2) - sin(phi1) * cos(phi2) * cos(deltaLon);
    final theta = atan2(y, x);

    compassBearing = (radToDeg(theta) + 360) % 360;

    _prevLat = lat;
    _prevLon = lon;
    return compassBearing;
  }

  Future<double> calculateTargetBearing({
    required double latTarget,
    required double lonTarget,
  }) async {
    final pos = await locationService.getCurrentPosition();
    final phi1 = degToRad(pos.latitude);
    final phi2 = degToRad(latTarget);
    final deltaLon = degToRad(lonTarget - pos.longitude);

    final y = sin(deltaLon) * cos(phi2);
    final x = cos(phi1) * sin(phi2) - sin(phi1) * cos(phi2) * cos(deltaLon);
    final theta = atan2(y, x);

    return (radToDeg(theta) + 360) % 360;
  }

  Future<double> calculateRotationAngle({
    required LatLng targetCoordinate,
  }) async {
    final travelB = await calculateTravelBearing();
    final targetB = await calculateTargetBearing(
      latTarget: targetCoordinate.latitude,
      lonTarget: targetCoordinate.longitude,
    );

    double diff = (targetB - travelB + 360) % 360;

    if (diff > 180) diff -= 360;

    return diff;
  }
}
