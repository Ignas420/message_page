import 'package:flutter/material.dart';

class StoryCircles extends StatelessWidget {
  final function;

  StoryCircles({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
        children: [
        Container(
          height: 110,
          width: 90,
          decoration: BoxDecoration(color: Colors.blue[800], shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
          left: 12,
          top: 12,
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          ),
        ),
        ],
        ),
      ),
    );
  }
}