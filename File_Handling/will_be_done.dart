import 'dart:io';

import 'package:flutter/material.dart';

class UnDone extends StatefulWidget {
  List<String>? records;
  List<String> readFile() {
    var file =
        File('D:/AA-SCHOOL/5.semester/VisualProgramming/Files/undone.txt');
    return file.readAsLinesSync();
  }

  UnDone() {
    records = readFile();
  }
  @override
  State<UnDone> createState() => UnDoneState();
}

class UnDoneState extends State<UnDone> {
  void update(index) {
    setState(() {
      var currentRecord = widget.records![index];
      widget.records!.removeAt(index);
      var undoneFile =
          File('D:/AA-SCHOOL/5.semester/VisualProgramming/Files/undone.txt');
      var output = '';
      for (int i = 0; i < widget.records!.length; ++i) {
        output += widget.records![i] + '\n';
      }
      undoneFile.writeAsStringSync(output);
      var donefile =
          File('D:/AA-SCHOOL/5.semester/VisualProgramming/Files/done.txt');
      donefile.writeAsString(currentRecord + '\n', mode: FileMode.append);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.records!.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(widget.records![index]),
        onTap: (() => update(index)),
      ),
    );
  }
}
