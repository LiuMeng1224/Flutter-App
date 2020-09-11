import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ECEIBS/pages/home_page.dart';
import 'package:ECEIBS/pages/mine_page.dart';
import 'package:ECEIBS/pages/learning_camp.dart';
import 'package:ECEIBS/pages/knowledge_center.dart';
import 'package:ECEIBS/componets/home/home_search.dart';

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
      ..add(KnowledgeCenter())
      ..add(MinePage());
    _tabData.forEach((element) {
      _itemList.add(BottomNavigationBarItem(
        icon: element["icon"],
        title: Text(element["text"]),
      ));
    });
  }

  //渲染AppBar
  _renderAppBar() {
    if (_currentIndex == 0) {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,//通过设置属性去掉返回按钮 automaticallyImplyLeading: false
        title: HomeSearch(),
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
      appBar:_renderAppBar(),
      backgroundColor: Colors.white,
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
