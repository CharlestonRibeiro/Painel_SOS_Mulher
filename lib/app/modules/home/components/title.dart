import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String interval;
  const TitleText({super.key, required this.interval});


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: Container(
        color: Colors.black45,
        padding: const EdgeInsets.all(20),
        child: Text(
          'LOCALIZAÇÕES $interval',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
