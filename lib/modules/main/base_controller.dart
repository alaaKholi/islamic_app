import 'dart:async';

import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart' as geolocator;

class BasePermissionController extends GetxController {
  late Coordinates? coordinates;
  late geolocator.Position position;

  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();
  Stream<LocationStatus> get stream => _locationStreamController.stream;

  Future _initLocationService() async {
    //locationn = Location();

    // if (!await locationn.serviceEnabled()) {
    //   if (!await locationn.requestService()) {
    //     return;
    //   }
    // }

    // PermissionStatus permission = await locationn.hasPermission();
    // if (permission == PermissionStatus.denied) {
    //   permission = await locationn.requestPermission();
    //   if (permission != PermissionStatus.granted) {
    //     return;
    //   }
    // }

    await checkLocationStatus();
    await checkLocationCoordinates();
    update();
  }

////////////////////////// check location permission ////////////////////////////////////////
  Future<void> checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == geolocator.LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
    update();
  }
///////////////////////////////////////////////////////////

  Future<void> checkLocationCoordinates() async {
    position = await geolocator.Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high);
    coordinates = Coordinates(
      position.latitude,
      position.longitude,
    );
    update();
  }

  @override
  Future<BasePermissionController> onInit() async {
    await _initLocationService();
    super.onInit();
    return this;
  }

  @override
  void onClose() {
    _locationStreamController.close();
    FlutterQiblah().dispose();
    super.onClose();
  }
}

 


  //  Future<LocationStatus> checkLocationStatuss() async {
  //   final status = await Geolocator.checkPermission();
  //   final enabled = await Geolocator.isLocationServiceEnabled();
  //   return LocationStatus(enabled, status);
  // }
////////////////////////////// get location coordinates ///////////////////////////////////
  // Future<void> getLocationn() async {
  //   var loc = await locationn.getLocation();
  //   coordinates = Coordinates(loc.latitude, loc.longitude);
  //   print("${loc.latitude} ${loc.longitude}");
  //   print(
  //       "----------------------------------------------------------------------");
  //   update();
  // }