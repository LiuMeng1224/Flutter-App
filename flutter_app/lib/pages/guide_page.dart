import 'package:ECEIBS/router/application.dart';
import 'package:ECEIBS/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//引导页面
class GuidePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GuidePageState();
  }

}

class _GuidePageState extends State<GuidePage>{
  PageController _controller;
  int realIndex = 0;
  bool _isHide = true;
  bool _isLogin = false;
  Future<SharedPreferences> _preference = SharedPreferences.getInstance();

  List<String> _imgList = [
    "assets/images/guide_first.webp",
    "assets/images/guide_second.webp",
    "assets/images/guide_third.webp",
    "assets/images/guide_fourth.webp",
    "assets/images/guide_fifth.webp"
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _controller = PageController(initialPage: realIndex);
    String token;
    _preference.then((SharedPreferences prefs) {
      token = prefs.getString("token");
      _isLogin = !(token==null || token.isNotEmpty);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //监听页面滑动
  _onPageChanged(int index){
      realIndex = index;
      if(realIndex < _imgList.length-1){
        _isHide = true;
      } else {
        _isHide = false;
      }
      setState(() {
      });
  }

  //获取子View页面
  List<Widget> _getPageViewItem(){
    List<Widget> itemList = [];
      _imgList.forEach((element) {
          itemList.add(Image.asset(element,fit: BoxFit.cover,));
      });

    return itemList;
  }

  //跳转到下一个页面
  _nextPage(){
    if(_isLogin){
      Application.router.navigateTo(context, Routers.home,clearStack: true);
    }else{
      Application.router.navigateTo(context, Routers.login,clearStack: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            PageView(
              controller: _controller,
              onPageChanged: _onPageChanged,
              children: _getPageViewItem(),
            ),
            Offstage( //控制child是否显示 当offstage为true，控件隐藏； 当offstage为false，显示； 当Offstage不可见的时候，如果child有动画等，需要手动停掉，Offstage并不会停掉动画等操作。
              offstage: _isHide,
              child:Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 100,
                  height: 36,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: Color(0xff005587),
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  child: GestureDetector(
                    onTap: _nextPage,
                    child: Text(
                      "立即开启",
                      style: TextStyle(backgroundColor: Color(0xff005587), color: Color(0xffffffff), fontSize:15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

      ]
      )
    );
  }

}