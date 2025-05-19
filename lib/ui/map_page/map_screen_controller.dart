import 'dart:developer';

import 'package:flutter_map/flutter_map.dart';
import 'package:geoguide/routes/app_navigator.dart';
import 'package:geoguide/services/location_service.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapScreenController extends GetxController {
  var locationService = Get.find<LocationService>();
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  late MapController mapController;
  RxBool isSatelliteView = false.obs;

  @override
  void onInit() async {
    super.onInit();
    mapController = MapController();
    final position = await locationService.getCurrentPosition();
  }

  void zoomIn() {
    mapController.move(
        mapController.camera.center, mapController.camera.zoom + 1);
  }

  void zoomOut() {
    mapController.move(
        mapController.camera.center, mapController.camera.zoom - 1);
  }

  void moveToCenter() async {
    log('Selected Location ${selectedLocation.value}');
    final position = await locationService.getCurrentPosition();
    selectedLocation.value = LatLng(position.latitude, position.longitude);
    mapController.move(LatLng(position.latitude, position.longitude), 17);
  }

  void toggleMapStyle() {
    isSatelliteView.toggle();
    update();
  }

  void selectLocation() {
    if (selectedLocation.value != null) {
      log('Selected Location ${selectedLocation.value}');
      locationService.selectedCoords.value = selectedLocation.value!;
      AppNavigator.openCompassPage();
    }
  }
}
