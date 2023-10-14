import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  double PercentWatched = 0;
  
  ProgressBar({required this.PercentWatched});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 15,
      percent: PercentWatched,
      progressColor: Colors.blue[400],
      backgroundColor: Colors.grey[600],
    );
  }
}