import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnActivityPlan extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LearnActivityPlanState();
  }

}

class LearnActivityPlanState extends State<LearnActivityPlan>{
  bool _isAllCard = false;

  @override
  Widget build(BuildContext context) {
    return _isAllCard?Card(
      elevation: 4,
      shadowColor: Color(0xff434343),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: _getPlanView(),
    ):_getPlanView();
  }

  //获取计划整体布局
  Widget _getPlanView(){
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(

      ),
    );
  }

  List<Widget> _getPlanList(){

    List<Widget> widgetList = [];



  }

  Widget _getPlanView(){

  }

}