import 'package:flutter/material.dart';
import 'package:geoguide/ui/shared/theme/app_colors.dart';
import 'package:latlong2/latlong.dart';

class ActualPositionLayer extends StatelessWidget {
  const ActualPositionLayer({super.key, required this.locationPin});

  final LatLng locationPin;

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Center(
          child: Icon(
            Icons.location_pin,
            color: AppColors.blue800,
            size: 40.0,
          ),
        ),
      ],
    );
  }
}
