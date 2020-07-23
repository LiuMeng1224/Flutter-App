import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ElectivePlanList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ElectivePlanListState();
  }

}

class ElectivePlanListState extends State<ElectivePlanList>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "选修计划"
      ),
    );
  }

}