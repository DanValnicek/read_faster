import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class reader extends StatefulWidget {
  String text;

  reader(this.text);

  @override
  State<StatefulWidget> createState() {
    return _readerState(this.text);
  }
}

class _readerState extends State<reader> {
  String text;
  int i = 0;
  String out;
  int speed = 300;

  _readerState(this.text);

  List<String> splitString(String text) {
    List<String> strings = text.split(' ');
    return strings;
  }

  @override
  void initState() {
    super.initState();
    out = splitString(text)[i];
    Timer.periodic(Duration(milliseconds: speed), (timer) {
      if (i == (splitString(text).length - 1)) {
        timer.cancel();
      }
      setState(() {
        i++;
        out = splitString(text)[i]; // your logic here
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Center(
                  child: SelectableText(
                    out,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 500,
                margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                child: Column(
                  children: [

                    IconButton(
                      icon: Icon(Icons.add) ,
                      onPressed: () {
                        speed += 50;
                      },
                      tooltip: 'Speed +',
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
