import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../stories/story1.dart';
import '../stories/story2.dart';
import '../stories/story3.dart';
import '../util/story_bars.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int StoryIndex=0;
  final List<Widget> myStories = [
    MyStory1(),
    MyStory2(),
    MyStory3()
  ];

  List<double> PercentWatched = [];

@override
  void initState() {
    super.initState();

    for(int i=0; i<myStories.length; i++){
      PercentWatched.add(0);
    }

     _startWatching();
  }


  void _startWatching(){
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if(PercentWatched[StoryIndex]+0.01 < 1){
          PercentWatched[StoryIndex] += 0.01;
        }
        else{
          PercentWatched[StoryIndex] = 1;
          timer.cancel();
          if(StoryIndex<myStories.length-1){
            StoryIndex++;
            _startWatching();
          }
          else{
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details){
    final double screenWidth  = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if(dx < screenWidth/2){
      setState(() {
        if(StoryIndex > 0 ){
          PercentWatched[StoryIndex-1]=0;
          PercentWatched[StoryIndex]=0;

          StoryIndex--;
        }
      });
    }
    else{
      setState(() {
        if(StoryIndex < myStories.length-1){
          PercentWatched[StoryIndex]=1;
          StoryIndex++;
        }
        else{
          PercentWatched[StoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:(details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
          myStories [StoryIndex],
            StoryBars(
              PercentWatched: PercentWatched,
            ),
          ]
        )
      ),
    );
  }
}