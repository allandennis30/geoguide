import 'package:flutter/material.dart';
import 'package:geoguide/ui/compass/info_widget.dart';
import 'package:get/get.dart';

import 'compass_controller.dart';

class CompassPage extends StatelessWidget {
  const CompassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompassController>(
      init: CompassController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(title: const Text('Bussula')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: const InfoWidget(),
        ),
      ),
    );
  }
}
