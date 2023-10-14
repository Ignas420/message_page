import 'package:flutter/material.dart';
import 'package:messagepage/util/story_progress_bar.dart';

class StoryBars extends StatelessWidget {
  List<double> PercentWatched = [];

  StoryBars({required this.PercentWatched});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 8, right: 8),
      child: Row(children: [
        Expanded(child: ProgressBar(PercentWatched: PercentWatched[0])),
        Expanded(child: ProgressBar(PercentWatched: PercentWatched[1])),
        Expanded(child: ProgressBar(PercentWatched: PercentWatched[2]))
      ],)
    );
  }
}