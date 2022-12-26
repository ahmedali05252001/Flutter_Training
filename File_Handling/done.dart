import 'dart:io';

import 'package:flutter/material.dart';

class Done extends StatefulWidget {
  List<String>? records;
  List<String> readFile() {
    var file = File('D:/AA-SCHOOL/5.semester/VisualProgramming/Files/done.txt');
    return file.readAsLinesSync();
  }

  Done() {
    records = readFile();
  }
  @override
  State<Done> createState() => DoneState();
}

class DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(widget.records![index]),
        onTap: () {},
        ),
      itemCount: widget.records!.length,
    );
  }
}
