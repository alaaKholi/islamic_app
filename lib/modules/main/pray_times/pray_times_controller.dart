// import 'dart:async';
// import 'package:adhan/adhan.dart';
// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:intl/intl.dart';
// import 'package:islamic_app/modules/main/base_controller.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PrayTimesController extends BasePermissionController {
//   late Position _position;

//   late PrayerTimes prayerTimes;

//   Future<PrayerTimes> init() async {
//     // permission=await permission.reques..t();
//     // switch () {
//     //   case PermissionStatus.granted:
//     //     // do something
//     //     break;
//     //   case PermissionStatus.denied:
//     //     // do something
//     //     break;
//     //   case PermissionStatus.permanentlyDenied:
//     //     // do something
//     //     break;
//     //   case PermissionStatus.restricted:
//     //     // do something
//     //     break;
//     //   case PermissionStatus.limited:
//     //     // do something
//     //     break;
//     //   default:
//     // }
//     _position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(_position);
//     print('My Prayer Times');
//     final myCoordinates = Coordinates(
//       _position.latitude,
//       _position.longitude,
//     ); // Replace with your own location lat, lng.
//     final params = CalculationMethod.egyptian.getParameters();
//     params.madhab = Madhab.shafi;
//     prayerTimes = PrayerTimes.today(myCoordinates, params);
//     return prayerTimes;
//   }

//   Future<void> checkLocationStatus() async {

//     print(
//         "---Today's Prayer Times in Your Local Timezone(${prayerTimes.fajr.timeZoneName})---");
//     print(DateFormat.jm().format(prayerTimes.fajr));
//     print(DateFormat.jm().format(prayerTimes.sunrise));
//     print(DateFormat.jm().format(prayerTimes.dhuhr));
//     print(DateFormat.jm().format(prayerTimes.asr));
//     print(DateFormat.jm().format(prayerTimes.maghrib));
//     print(DateFormat.jm().format(prayerTimes.isha));

//     print('---');

//     update();
//   }

//   @override
//   Future<PrayTimesController> onInit() async {
//     await init();
//     await checkLocationStatus();
//     super.onInit();
//     return this;
//   }

//   @override
//   void onReady() {
//     // called after the widget is rendered on screen
//     //await checkLocationStatus();

//     super.onReady();
//   }

//   @override
//   void onClose() {
//     // called just before the Controller is deleted from memory
//     super.onClose();
//   }
// }

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:adhan_dart/adhan_dart.dart';

import '../base_controller.dart';

class PrayTimesController extends BasePermissionController {
  late PrayerTimes prayerTimes;
  late Future<PrayerTimes> prayerTimesfuturre;

  Future<PrayerTimes> init() async {
   
    tz.initializeTimeZones();
    final location = tz.local;
    
    DateTime date = tz.TZDateTime.from(DateTime.now(), location);

    // Parameters
    CalculationParameters params = CalculationMethod.Egyptian();
    params.madhab = Madhab.Shafi;
    if(coordinates!=null) {
      prayerTimes = PrayerTimes(coordinates!, date, params, precision: true);
    }

    // Prayer times
    // DateTime fajrTime = tz.TZDateTime.from(prayerTimes.fajr!, location);
    // DateTime sunriseTime = tz.TZDateTime.from(prayerTimes.sunrise!, location);
    // DateTime dhuhrTime = tz.TZDateTime.from(prayerTimes.dhuhr!, location);
    // DateTime asrTime = tz.TZDateTime.from(prayerTimes.asr!, location);
    // DateTime maghribTime = tz.TZDateTime.from(prayerTimes.maghrib!, location);
    // DateTime ishaTime = tz.TZDateTime.from(prayerTimes.isha!, location);

    // DateTime ishabeforeTime =
    //     tz.TZDateTime.from(prayerTimes.ishabefore!, location);
    // DateTime fajrafterTime =
    //     tz.TZDateTime.from(prayerTimes.fajrafter!, location);

    // Convenience Utilities
    String current =
        prayerTimes.currentPrayer(date: DateTime.now()); // date: date
    DateTime? currentPrayerTime = prayerTimes.timeForPrayer(current);
    String next = prayerTimes.nextPrayer();
    DateTime? nextPrayerTime = prayerTimes.timeForPrayer(next);

    // Sunnah Times
    // SunnahTimes sunnahTimes = SunnahTimes(prayerTimes);
    // DateTime middleOfTheNight =
    //     tz.TZDateTime.from(sunnahTimes.middleOfTheNight, location);
    // DateTime lastThirdOfTheNight =
    //     tz.TZDateTime.from(sunnahTimes.lastThirdOfTheNight, location);

    // // Qibla Direction
    // var qiblaDirection = Qibla.qibla(coordinates);

    // print('***** Current Time');
    // print('local time:\t$date');

    // print('\n***** Prayer Times');
    // print('fajrTime:\t$fajrTime');
    // print('sunriseTime:\t$sunriseTime');
    // print('dhuhrTime:\t$dhuhrTime');
    // print('asrTime:\t$asrTime');
    // print('maghribTime:\t$maghribTime');
    // print('ishaTime:\t$ishaTime');

    // print('ishabeforeTime:\t$ishabeforeTime');
    // print('fajrafterTime:\t$fajrafterTime');

    // print('\n***** Convenience Utilities');
    // print('current:\t$current\t$currentPrayerTime');
    // print('next:   \t$next\t$nextPrayerTime');

    // print('\n***** Sunnah Times');
    // print('middleOfTheNight:  \t$middleOfTheNight');
    // print('lastThirdOfTheNight:  \t$lastThirdOfTheNight');

    // print('\n***** Qibla Direction');
    // print('qibla:  \t$qiblaDirection');
    update();
    return prayerTimes;
  }

  @override
  Future<PrayTimesController> onInit() async {
    await super.onInit();
    await init();
    
    return this;
  }
}
