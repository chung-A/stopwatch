import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  List<String> lapTimes = List();
  Stopwatch watch = Stopwatch();
  String elapsedTime = '00:00:00:000';

  Timer timer;

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
                elapsedTime,
                style: TextStyle(fontSize: 25),
              ),
              padding: EdgeInsets.all(20),
            ),
            Container(
              width: 100,
              height: MediaQuery.of(context).size.height-250,
              child: ListView(
                children: lapTimes.map((item) => Text(item)).toList(),
              ),
            ),
            Container(
                width: 200,
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      child: watch.isRunning
                          ? Icon(Icons.stop)
                          : Icon(Icons.play_arrow),
                      onPressed: () {
                        if(watch.isRunning) {
                          stopWatch();
                        }else{
                          startWatch();
                        }
                      },
                    ),
                    FloatingActionButton(
                      child: watch.isRunning ? Text("기록") : Text("리셋"),
                      onPressed: () {
                        watch.isRunning?recordTimer():resetWatch();
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  String transTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String milliSecondsString =
        (milliseconds % 1000).toString().padLeft(3, '0');
    String secondsString = (seconds % 60).toString().padLeft(2, '0');
    String minutesString = (minutes % 60).toString().padLeft(2, '0');
    String hoursString = (hours % 24).toString().padLeft(2, '0');

    StringBuffer stb = StringBuffer();
    stb.writeAll([
      hoursString,
      ":",
      minutesString,
      ":",
      secondsString,
      ":",
      milliSecondsString
    ]);
    return stb.toString();
  }

  startWatch(){
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 1),updateTimer);
  }

  stopWatch(){
    setState(() {
      watch.stop();
      if(timer.isActive) {
        timer.cancel();
      }
    });
  }

  resetWatch(){
    setState(() {
      watch.reset();
      lapTimes.clear();
      elapsedTime=transTime(0);
    });
  }

  updateTimer(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transTime(watch.elapsedMilliseconds);
      });
    }
  }

  recordTimer() {
    setState(() {
      lapTimes.add("lab"+((lapTimes.length/2).truncate()+1).toString());
      lapTimes.add(elapsedTime);
    });
  }
}
