
import 'package:ECEIBS/common/common_color.dart';
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

  List<String> titles = ["选修计划","必修计划","项目"];
  List<Widget> _widgetList = [ElectiveLibraryList(),ElectivePlanList(),CompulsoryPlanList(),ProjectList()];
  int _currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "学习营",
            style: TextStyle(
              color: CommonColor.textNormalColor,
              fontSize: 17
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: CommonColor.dividerLineF7,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              color: Colors.white,
              alignment: Alignment.center,
              child: Row(
                children: _getTabList(MediaQuery.of(context).size.width/titles.length),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: CommonColor.dividerLineF7,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: _onPageChanged,
                children: _widgetList,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTabList(double width){

    List<Widget> widgetList = [];
    titles.forEach((element) {
      widgetList.add(_getTabItem(element,width));
    });
    return widgetList;
  }


  Widget _getTabItem(String label,double width){
    return InkWell(
      onTap: (){
        _currentIndex = titles.indexOf(label);
        _controller.jumpToPage(_currentIndex);
        setState(() {

        });
      },
      child: Container(
        width: width,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          label,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _currentIndex==titles.indexOf(label)?CommonColor.themeColor:CommonColor.textNormalColor,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  _onPageChanged(int index){
    _currentIndex = index;
    setState(() {

    });
  }
}