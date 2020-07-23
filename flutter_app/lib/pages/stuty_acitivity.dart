import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudyActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StudyActivityState();
  }


}

class StudyActivityState extends State<StudyActivity>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "学习动态"
      ),
    );
  }

}