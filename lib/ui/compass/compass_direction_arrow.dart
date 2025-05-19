import 'dart:math';
import 'package:flutter/material.dart';
import 'package:geoguide/ui/compass/compass_controller.dart';
import 'package:geoguide/ui/compass/radial_list.dart';
import 'package:get/get.dart';

class CompassDirectionArrow extends StatelessWidget {
  const CompassDirectionArrow({super.key});

  @override
  Widget build(BuildContext context) {
    double radius = MediaQuery.of(context).size.width * 0.40;
    final CompassController controller = Get.find<CompassController>();
    return Obx(() {
      double heading = controller.heading.value;
      double compassHeading = controller.compassHeading.value;
      return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: heading),
        duration: const Duration(milliseconds: 100),
        builder: (context, value, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                filterQuality: FilterQuality.high,
                angle: compassHeading * (pi / 180) * -1,
                child: Image.asset(
                  'assets/compass/borda.png',
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.width * 0.75,
                ),
              ),
              RadialList(
                radialList: radialNumbers,
                radius: radius,
                degree: compassHeading,
              ),
              Transform.rotate(
                filterQuality: FilterQuality.high,
                angle: value * (pi / 180),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.20,
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.20,
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
