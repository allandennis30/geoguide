import 'package:flutter/material.dart';
import 'package:geoguide/ui/compass/compass_controller.dart';
import 'package:geoguide/ui/compass/compass_direction_arrow.dart';
import 'package:geoguide/ui/shared/theme/app_colors.dart';
import 'package:geoguide/ui/shared/theme/app_spacing.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
  });

  static final _numberFormat = NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    final compasssController = Get.find<CompassController>();

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.grey400,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Obx(() {
                  var distanceFromSubsample =
                      compasssController.distanceFromTarget.value;
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Distancia: ',
                            style: TextStyle(fontSize: 20)),
                        Text(
                          _numberFormat
                              .format(distanceFromSubsample)
                              .replaceAll(',', '.'),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const CompassDirectionArrow(),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}
