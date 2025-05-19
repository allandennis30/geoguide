import 'dart:async';
import 'dart:developer' as dv;

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationService extends GetxService {
  final isEmptyLocal = false.obs;
  final isLocalDisable = false.obs;
  final currentLocation = Rx<LatLng?>(null);
  final selectedCoords = Rx<LatLng?>(null);
  final currentSpeed = 0.0.obs;

  StreamSubscription<Position>? _positionSub;
  DateTime? lastUpdateTime;

  @override
  void onInit() {
    _initLocationUpdates();
    super.onInit();
  }

  Future<void> _initLocationUpdates() async {
    // 1. Verifica se o serviço de localização está habilitado
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location Required', 'Please enable location services');
      return;
    }

    // 2. Verifica permissões
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await Get.dialog(
        AlertDialog(
          title: const Text('Location Access Required'),
          content:
              const Text('This app needs location access to function properly'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await Geolocator.openAppSettings();
                Get.back();
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        Get.snackbar('Permission Required',
            'Location access is needed for core functionality');
        return;
      }
    }

    // 3. Inicia o listener de posição
    _positionSub = Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 10, // só recebe updates a cada 10m
      ),
    ).listen((Position position) {
      final latLng = LatLng(position.latitude, position.longitude);
      final accuracy = position.accuracy;
      if (accuracy != null && accuracy > 30) return;

      currentLocation.value = latLng;
      lastUpdateTime = DateTime.now();
      currentSpeed.value = (position.speed ?? 0) * 3.6;
      isEmptyLocal.value = false;
      isLocalDisable.value = false;
    }, onError: (error, stack) {
      dv.log('Location error: $error', stackTrace: stack);
      isEmptyLocal.value = true;
      if (error.toString().contains('Location services disabled')) {
        isLocalDisable.value = true;
      } else {
        isLocalDisable.value = false;
      }
    });
  }

  Future<void> stopLocationUpdates() async {
    await _positionSub?.cancel();
    _positionSub = null;
  }

  Future<LatLng> getCurrentPosition() async {
    // Garante permissão
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw Exception('Location access is needed for core functionality');
      }
    }
    final position = await Geolocator.getCurrentPosition();
    final latLng = LatLng(position.latitude, position.longitude);
    currentLocation.value = latLng;
    return latLng;
  }

  @override
  void onClose() {
    _positionSub?.cancel();
    super.onClose();
  }
}
