import 'package:flutter/material.dart';
import 'package:geoguide/ui/map_page/map_page.dart';
import 'package:get/get.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) {
        return MapPage(
          mapPageController: controller.mapPageController,
        );
      },
    );
  }
}
