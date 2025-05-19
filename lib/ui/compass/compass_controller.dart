import 'dart:developer';

import 'package:geoguide/services/location_service.dart';
import 'package:geoguide/ui/compass/bearing_calculator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'dart:async';

class CompassController extends GetxController {
  final Rx<double> heading = 0.0.obs;
  final Rx<double> compassHeading = 0.0.obs;
  final Rx<bool> hasPermission = false.obs;
  late final Rx<LatLng?> targetSelected;
  Rx<double> distanceFromTarget = 0.0.obs;
  final BearingCalculator bearingCalculator = BearingCalculator();
  final locationService = Get.find<LocationService>();
  Timer? _headingTimer;

  @override
  void onInit() async {
    super.onInit();
    targetSelected = locationService.selectedCoords;
    setHeading();
    _headingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setHeading();
      calculateDistance();
    });
  }

  @override
  void onClose() {
    super.onClose();
    _headingTimer?.cancel();
  }

  void calculateDistance() async {
    final actualCoordinates = await locationService.getCurrentPosition();

    var distance = const Distance().as(
      LengthUnit.Meter,
      actualCoordinates,
      targetSelected.value!,
    );
    distanceFromTarget.value = distance;
  }

  void setHeading() async {
    var speed = locationService.currentSpeed.value;
    compassHeading.value = bearingCalculator.compassBearing;

    if (speed >= 1.5) {
      log('Speed $speed');

      final rotationAngle = await bearingCalculator.calculateRotationAngle(
          targetCoordinate: targetSelected.value!);

      heading.value = rotationAngle;
      log('Rotation ${rotationAngle.toString()}');
    }
  }
}
