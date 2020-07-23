
import 'package:ECEIBS/pages/study/compulsory_plan_list.dart';
import 'package:ECEIBS/pages/study/elective_library_list.dart';
import 'package:ECEIBS/pages/study/elective_plan_list.dart';
import 'package:ECEIBS/pages/study/project_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearningCampPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LearningCampState();
  }
}

class LearningCampState extends State<LearningCampPage>{

  List<String> titles = ["选修库","选修计划","必修计划","项目"];
  List<Widget> _widgetList = [ElectiveLibraryList(),ElectivePlanList(),CompulsoryPlanList(),ProjectList()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: _getTitle(),
        ),
        body: _getBody(),
      ),
    );
  }

  Widget _getTitle(){
    return TabBar(
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.only(top:12,left:12,right:12),
      tabs: titles.map((e) => Tab(child: Text(e,style: TextStyle(color: Color(0xff005587),),),)).toList(),
      onTap: (index){
        _currentIndex = index;
        setState(() {

        });
      },
    );
  }

  Widget _getBody(){
    return IndexedStack(
      index: _currentIndex,
      children: _widgetList,
    );
  }
}