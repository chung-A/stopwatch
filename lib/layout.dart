import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("세이나 스톱워치!"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                '00:00:00:0000',
                style: TextStyle(fontSize: 25),
              ),
              padding: EdgeInsets.all(20),
            ),
            Container(
                width: 100,
                height: 200,
                child: ListView(
                  children: [
                    Text("lab1"), Text("01:00:00:0000"),
                    Text("lab1"), Text("01:00:00:0000"),
                    Text("lab1"), Text("01:00:00:0000"),
                    Text("lab1"), Text("01:00:00:0000"),
                    Text("lab1"), Text("01:00:00:0000"),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
