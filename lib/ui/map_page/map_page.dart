import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geoguide/ui/map_page/actual_position_layer.dart';
import 'package:geoguide/ui/map_page/map_floating_buttons.dart';
import 'package:geoguide/ui/map_page/map_screen_controller.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({
    super.key,
    required this.mapPageController,
    this.listTiles,
  });

  final MapScreenController mapPageController;
  final List<Widget>? listTiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapScreenController>(
        init: mapPageController,
        builder: (controller) {
          return Obx(() {
            var initialCenter =
                controller.locationService.currentLocation.value ??
                    const LatLng(0, 0);
            return initialCenter == const LatLng(0, 0)
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      FlutterMap(
                        mapController: controller.mapController,
                        options: MapOptions(
                          initialCenter: LatLng(
                            initialCenter.latitude,
                            initialCenter.longitude,
                          ),
                          initialZoom: 17.0,
                          onPositionChanged: (position, hasGesture) {
                            controller.selectedLocation.value = position.center;
                          },
                        ),
                        children: [
                          Obx(() => TileLayer(
                              urlTemplate: controller.isSatelliteView.value
                                  ? "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                                  : "https://mt1.google.com/vt/lyrs=s&x={x}&y={y}&z={z}",
                              subdomains: controller.isSatelliteView.value
                                  ? const ['a', 'b', 'c']
                                  : const ['mt0', 'mt1', 'mt2', 'mt3'])),
                          Obx(() => Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: ActualPositionLayer(
                                  locationPin: controller
                                      .locationService.currentLocation.value!,
                                ),
                              )),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: MapFloatingButtons(
                            mapPageController: controller,
                            initialCenter: LatLng(
                              initialCenter.latitude,
                              initialCenter.longitude,
                            )),
                      ),
                    ],
                  );
          });
        },
      ),
    );
  }
}
