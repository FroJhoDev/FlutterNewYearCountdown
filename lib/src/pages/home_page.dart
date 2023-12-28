import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';

import '../components/time_numbers_components.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final int endTime = DateTime(2024).millisecondsSinceEpoch + 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Parallax(
        sensor: ParallaxSensor.accelerometer,
        layers: [
          Layer(
            sensitivity: 12,
            image: const AssetImage('assets/images/christmas_landscape_bg.png'),
            preventCrop: true,
            imageFit: BoxFit.cover,
          ),
          Layer(
            sensitivity: 0,
            child: Center(
              child: CountdownTimer(
                endTime: endTime,
                widgetBuilder: (_, CurrentRemainingTime? time) {
                  if (time == null) {
                    return const Text(
                      'Feliz Ano Novo!',
                      style: TextStyle(
                        fontSize: 46.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'O Ano Novo Chega em'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            .animate(
                                onPlay: (controller) => controller.repeat())
                            .shimmer(
                                delay: 2000.ms,
                                duration: 5000.ms,
                                color: Colors.yellow[200]),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TimeNumbersComponents(
                              title: 'Dias',
                              timeValue: time.days!,
                            ),
                            TimeNumbersComponents(
                              title: 'Horas',
                              timeValue: time.hours!,
                            ),
                            TimeNumbersComponents(
                              title: 'Minutos',
                              timeValue: time.min!,
                            ),
                            TimeNumbersComponents(
                              title: 'Segundos',
                              timeValue: time.sec!,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
          Layer(
            sensitivity: 3,
            child: Center(
              child: Lottie.asset(
                'assets/lottie/snow_animation.json',
                fit: BoxFit.cover,
              ),
            ),
            preventCrop: true,
          ),
        ],
      ),
    );
  }
}
