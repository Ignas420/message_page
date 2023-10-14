import 'package:flutter/material.dart';
import 'package:messagepage/util/story_circles.dart';
import 'story_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _openStory(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
              Text(
                'Chats',
                style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(width: 50),
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 255, 0, 136),
                shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(4),
                child: Icon(
                Icons.search,
                weight: 10,
                color: Colors.white,
                size: 30,
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 177, 32, 234),
                shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(4),
                child: Icon(
                Icons.add,
                weight: 10,
                color: Colors.white,
                size: 30,
                ),
              )
            ],),
            SizedBox(height: 40),
            SizedBox(
            height: 145,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryCircles(
                  function: _openStory,
                );
              },
            ),
          ),
        Container(
          child: Container(
            height: 400,
            child: ListView(
              children: [
                SizedBox(
                  height: 450,
                  child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    height: 80,
                    width: 160,
                    margin: EdgeInsets.all(14),
                    child: Center(
                      child: Text(
                      "Card $index",
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                    color: Colors.blue[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),
)
    );
  }
}