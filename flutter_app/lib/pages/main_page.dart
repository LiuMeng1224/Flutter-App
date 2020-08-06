import 'package:ECEIBS/pages/HomePage.dart';
import 'package:ECEIBS/pages/MinePage.dart';
import 'package:ECEIBS/pages/VideoTest.dart';
import 'package:ECEIBS/pages/learning_camp.dart';
import 'package:ECEIBS/pages/stuty_acitivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//主页面
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  List<Widget> _widgetList = [];
  List _tabData = [
    {"text": "首页", "icon": Icon(Icons.home)},
    {"text": "学习营", "icon": Icon(Icons.school)},
    {"text": "动态", "icon": Icon(Icons.camera)},
    {"text": "我的", "icon": Icon(Icons.perm_identity)}
  ];
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _itemList = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _widgetList
      ..add(HomePage())
      ..add(LearningCampPage())
      ..add(StudyActivity())
      ..add(MinePage());
    _tabData.forEach((element) {
      _itemList.add(BottomNavigationBarItem(
        icon: element["icon"],
        title: Text(element["text"]),
      ));
    });
  }

  //渲染AppBar
  _renderAppBar(BuildContext context, Widget widget) {
    if (_currentIndex == 0) {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,//通过设置属性去掉返回按钮 automaticallyImplyLeading: false
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 30,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: GestureDetector(
                  child: Text(
                    "搜索课程/培训计划/学习资源",
                    style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: 10,
                    ),
                  ),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoTest()));
                },
                child: Image.asset(
                  "assets/images/message_new.webp",
                  width: ScreenUtil().setWidth(45),
                  height: ScreenUtil().setWidth(45),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  //页面切换回调
  _onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _renderAppBar(context, widget),
      backgroundColor: Color(0xfff7f7f7),
      body: IndexedStack(
        index: _currentIndex,
        children: _widgetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _itemList,
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        fixedColor: Color(0xff005587),
      ),
    );
  }
}
