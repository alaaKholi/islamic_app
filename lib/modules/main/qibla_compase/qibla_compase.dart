// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import '../../../widgets/location_error.dart';
import 'package:geolocator/geolocator.dart';

import 'widgets/qibla_compass_widget.dart';
import 'qibla_controller.dart';

class QiblahCompassScreen extends GetView<QiblaCompassController> {
  // final qiblaController = Get.put(QiblaCompassController());
//
  QiblahCompassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblaCompassController>(
        
        builder: (controller) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: controller.stream,
              builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: Colors.amber,
                  );
                }
                if (snapshot.data!.enabled == true) {
                  switch (snapshot.data!.status) {
                    case LocationPermission.always:
                    case LocationPermission.whileInUse:
                      return const QiblaCompassWidget();
                    case LocationPermission.denied:
                      return LocationErrorWidget(
                        error: "Location service permission denied",
                        callback: controller.checkLocationStatus,
                      );
                    case LocationPermission.deniedForever:
                      return LocationErrorWidget(
                        error: "Location service Denied Forever !",
                        callback: controller.checkLocationStatus,
                      );
                    default:
                      return Container();
                  }
                } else {
                  return LocationErrorWidget(
                    error: "Please enable Location service",
                    callback: controller.checkLocationStatus,
                  );
                }
              },
            ),
          );
        });
  }
}
