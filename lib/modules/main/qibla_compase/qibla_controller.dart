import 'dart:async';
// import 'package:adhan/adhan.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:islamic_app/modules/main/base_controller.dart';
import 'package:geolocator/geolocator.dart';

class QiblaCompassController extends BasePermissionController {
  // final _locationStreamController =
  //     StreamController<LocationStatus>.broadcast();
  // Stream<LocationStatus> get stream => _locationStreamController.stream;

  // Future<void> checkLocationStatus() async {
  //   final locationStatus = await FlutterQiblah.checkLocationStatus();
  //   if (locationStatus.enabled &&
  //       locationStatus.status == LocationPermission.denied) {
  //     await FlutterQiblah.requestPermissions();
  //     final s = await FlutterQiblah.checkLocationStatus();
  //     _locationStreamController.sink.add(s);
  //   } else {
  //     _locationStreamController.sink.add(locationStatus);
  //   }
  //   update();
  // }

  // late double q;
  @override
  Future<QiblaCompassController> onInit() async {
    
    super.onInit();
    await checkLocationStatus();
    // q = Qibla.qibla(coordinates);
    // print(q);
    return this;
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    //await checkLocationStatus();

    super.onReady();
  }

  @override
  void onClose() {
    //_locationStreamController.close();
    //FlutterQiblah().dispose();
    super.onClose();
  }
}
