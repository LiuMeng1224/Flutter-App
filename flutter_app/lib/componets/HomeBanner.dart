import 'dart:async';

import 'package:ECEIBS/model/BannerItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeBannerState();
  }
}

class HomeBannerState extends State<HomeBanner>{
  PageController _mPageController;
  int _realIndex = 1;
  int _virtualIndex = 0;
  Timer _timer; //定时器
  List<BannerItem> _bannerList = [];


  @override
  void initState() {
    super.initState();
    _mPageController = PageController(initialPage: _realIndex);
    _initData();
  }

  _initData(){
    _bannerList.add(BannerItem(
      "422",
      "中欧数字商学院 赋能时代领导者",
      "https://img.eceibs.net/image/zo/06a38c6885844cb682afe19a143a4f89.jpg?x-oss-process=image/resize,w_750,h_328,m_fill,limit_0/quality,q_50",
      "https://zo.eceibs.net/index.php/front/project/detail?trainplanId=11091",
      1
    ));
    _bannerList.add(BannerItem(
        "432",
        "数字中欧 与你共克时艰",
        "https://img.eceibs.net/image/zo/be41fad90a2d49daa4d9b4b86bedb81c.jpg?x-oss-process=image/resize,w_750,h_328,m_fill,limit_0/quality,q_50",
        "https://zo.eceibs.net/mobile/#/main/banner_detail?banner_id=432",
        0
    ));

    if(_bannerList.length>1){
      _timer = Timer.periodic(Duration(seconds: 3),(timer){ //创建循环计时器
        if(_mPageController.hasClients){
          _mPageController.animateToPage(_realIndex + 1,
              duration: Duration(milliseconds: 300), curve: Curves.linear);
        }
      });
    }
  }

  //监听轮播图滑动回调
  _onPageChanged(int index){
    _realIndex = index;

    if(index == 0){
      _virtualIndex = _bannerList.length - 1;
      _mPageController.jumpToPage(_bannerList.length);
    }else if(index == _bannerList.length+1){
      _virtualIndex = 0;
      _mPageController.jumpToPage(1);
    }else{
      _virtualIndex = index - 1;
    }

    setState(() {
    });
  }

  List<Widget> _buildItems(){
    List<Widget> items = [];
    if(_bannerList.length>1){
        items.add(_buildItem(_bannerList[_bannerList.length-1]));
        items.addAll(_bannerList
            .map((item) => _buildItem(item))
            .toList(growable: false)
        );
        items.add(_buildItem(_bannerList[0]));
    }else{
      items.add(_buildItem(_bannerList[0]));
    }
    return items;
  }

  Widget _buildItem(BannerItem item){

    return GestureDetector(
      onTap: (){

      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(item.img,fit: BoxFit.cover,)
        ],
      ),
    );
  }

  //轮播图下方的指示器
  Widget _buildIndicator(){
    List<Widget> indicators = [];
    for(int i = 0; i < _bannerList.length; i++) {
      indicators.add(Container(
        width: 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 1.5,vertical: 15.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i == _virtualIndex ? Color(0x50000000):Color(0x50ffffff),
        ),
      ));
    }

    return Row(mainAxisAlignment:MainAxisAlignment.center,children: indicators,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _mPageController,
            onPageChanged: _onPageChanged,
            children: _buildItems(),
          ),
          _buildIndicator(),
        ],
      ),
    );
  }

}