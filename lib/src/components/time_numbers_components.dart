import 'package:flutter/material.dart';

class TimeNumbersComponents extends StatelessWidget {
  final String title;
  final int timeValue;

  const TimeNumbersComponents(
      {super.key, required this.title, required this.timeValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 20.0),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          Text(
            '${(timeValue < 10 ? '0' : '')}$timeValue',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
