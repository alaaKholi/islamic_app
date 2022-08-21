// import 'package:adhan_dart/adhan_dart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:geolocator/geolocator.dart';

// import 'pray_times_controller.dart';

// class PrayTimesScreen extends GetView<PrayTimesController> {
//   const PrayTimesScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PrayTimesController>(
//         init: PrayTimesController(),
//         builder: (controller) {
//           return Scaffold(
//             body: FutureBuilder<PrayerTimes>(
//                 future: controller.init(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const CircularProgressIndicator(
//                       color: Colors.pink,
//                     );
//                   } else if (snapshot.hasError) {
//                     return const CircularProgressIndicator();
//                   } else {
//                     return Center(
//                         child:
//                             Text(controller.prayerTimes.asr!.hour.toString()));
//                   }
//                 }),
//           );
//         });
//   }
// }
import 'package:adhan_dart/adhan_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:islamic_app/utils/utils.dart';

import '../../../widgets/location_error.dart';
import 'pray_times_controller.dart';

class PrayTimesScreen extends GetView<PrayTimesController> {
  const PrayTimesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayTimesController>(
        init: PrayTimesController(),
        builder: (controller) {
          return Scaffold(
            body: StreamBuilder(
                stream: controller.stream,
                builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
                  print(snapshot.data?.status);
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  } else if (snapshot.data!.enabled == true) {
                    switch (snapshot.data!.status) {
                      case LocationPermission.always:
                      case LocationPermission.whileInUse:
                        // return Text(controller.prayerTimes.asr!.hour.toString());
                        return FutureBuilder<PrayerTimes>(
                            future: controller.init(),
                            builder:
                                (context, AsyncSnapshot<PrayerTimes> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator(
                                  color: Colors.pink,
                                );
                                // } else if (snapshot.hasError) {
                                //   return const CircularProgressIndicator(color: Colors.green,);
                              } else {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          'fajr : ${Utils.formateDateTime(controller.prayerTimes.fajr!)}'),
                                      Text(
                                          'sun rise : ${Utils.formateDateTime(controller.prayerTimes.sunrise!)}'),
                                      Text(
                                          'duhur : ${Utils.formateDateTime(controller.prayerTimes.dhuhr!)}'),
                                      Text(
                                          'asr : ${Utils.formateDateTime(controller.prayerTimes.asr!)}'),
                                      Text(
                                          'maghrib : ${Utils.formateDateTime(controller.prayerTimes.maghrib!)}'),
                                      Text(
                                          'isha : ${Utils.formateDateTime(controller.prayerTimes.isha!)}'),
                                    ],
                                  ),
                                );
                              }
                            });
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
                }),
          );
        });
  }
}
