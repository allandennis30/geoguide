import 'dart:async';
import 'package:geoguide/services/location_service.dart';
import 'package:geoguide/ui/map_page/map_screen_controller.dart';
import 'package:get/get.dart';

class ServicesManager {
  static final wereServicesFirstInitialized = Completer<void>();

  static Future<void> init({bool createNonDeletables = true}) async {
    if (createNonDeletables) {
      Get.put(LocationService());
      Get.put(MapScreenController());
    }

    if (!wereServicesFirstInitialized.isCompleted) {
      wereServicesFirstInitialized.complete();
    }
  }
}
