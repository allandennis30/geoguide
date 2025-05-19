import 'package:flutter/material.dart';
import 'package:geoguide/ui/map_page/map_screen_controller.dart';
import 'package:geoguide/ui/shared/button.dart';
import 'package:geoguide/ui/shared/theme/app_colors.dart';
import 'package:latlong2/latlong.dart';

class MapFloatingButtons extends StatelessWidget {
  final MapScreenController mapPageController;
  final LatLng initialCenter;

  const MapFloatingButtons({
    super.key,
    required this.mapPageController,
    required this.initialCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Button.primary(
          backgroundColor: AppColors.blue800,
          content: const Icon(Icons.zoom_in),
          onPressed: () => mapPageController.zoomIn(),
        ),
        const SizedBox(height: 10),
        Button.primary(
          backgroundColor: AppColors.blue800,
          content: const Icon(Icons.zoom_out),
          onPressed: () => mapPageController.zoomOut(),
        ),
        const SizedBox(height: 10),
        Button.primary(
          backgroundColor: AppColors.blue800,
          content: const Icon(Icons.location_pin),
          onPressed: mapPageController.moveToCenter,
        ),
        const SizedBox(height: 10),
        Button.primary(
          backgroundColor: AppColors.blue800,
          content: const Icon(Icons.satellite),
          onPressed: () => mapPageController.toggleMapStyle(),
        ),
        const SizedBox(height: 10),
        Button.primary(
          backgroundColor: AppColors.blue800,
          content: const Text("Select"),
          onPressed: mapPageController.selectLocation,
        ),
      ],
    );
  }
}
