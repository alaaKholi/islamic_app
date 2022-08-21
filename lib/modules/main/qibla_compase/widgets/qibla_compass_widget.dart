import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Helpers/assets_helper.dart';
import 'dart:math' show pi;

class QiblaCompassWidget extends StatelessWidget {
  const QiblaCompassWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final qiblahDirection = snapshot.data!;
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Transform.rotate(
                    angle: (qiblahDirection.direction * (pi / 180) * -1),
                    child: Image.asset(
                      AssetsHelper.img_qibla_dial,
                      width: 320.w,
                      height: 320.h,
                     // color: ThemeColor.colorPrimary(context),
                    ),
                  ),
                  Transform.rotate(
                    angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                    alignment: Alignment.center,
                    child: Image.asset(
                      AssetsHelper.img_qibla_arrow,
                      fit: BoxFit.contain,
                      height: 220.h,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  qiblahDirection.offset.toStringAsFixed(3),
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
