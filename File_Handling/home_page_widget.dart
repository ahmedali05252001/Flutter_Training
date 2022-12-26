import 'package:flutter/material.dart';
import 'package:project1/project1/done.dart';
import 'package:project1/project1/will_be_done.dart';

class HomePageWidget extends StatefulWidget {
  @override
  State<HomePageWidget> createState() => HomePageWidgetState();
}

class HomePageWidgetState extends State<HomePageWidget> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pages = [Done(), UnDone()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.raw_on),
            label: 'Ongoing',
          )
        ],
      ),
    );
  }
}
