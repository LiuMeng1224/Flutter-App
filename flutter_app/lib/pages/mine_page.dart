import 'package:ECEIBS/model/ModuleItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MinPageState();
  }

}

class MinPageState extends State<MinePage>{

  List<ModuleItem> dataList = [];
  int _lines = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async{
    dataList.add(ModuleItem("离线下载","","","","assets/images/icon_mine_download.png"));
    dataList.add(ModuleItem("收藏","","","","assets/images/icon_mine_collect.png"));
    dataList.add(ModuleItem("学习轨迹","","","","assets/images/icon_mine_learn_history.png"));
    dataList.add(ModuleItem("我的笔记","","","","assets/images/icon_mine_note.png"));
    dataList.add(ModuleItem("我的提问","","","","assets/images/icon_mine_my_questions.png"));
    dataList.add(ModuleItem("打卡","","","","assets/images/icon_mine_docard.png"));
    double result = dataList.length/4.0;
    if(dataList.length%4 > 0){
      _lines = result.toInt() +1;
    }else{
      _lines = result.toInt();
    }
    print("_lines=======$_lines");
    setState(() {

    });
  }

  //用户信息布局
  Widget _getUserInfo(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(43)),
            alignment: Alignment.centerRight,
            child: Image.asset("assets/images/icon_setting.png",
              width: ScreenUtil().setWidth(58),
              height: ScreenUtil().setWidth(58),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icon_mine_header.png",
                  width: ScreenUtil().setWidth(180),
                  height: ScreenUtil().setWidth(180),
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Frances Fox",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff2A2B2B),
                          fontSize: ScreenUtil().setSp(52),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("最近登录：2020.04.23",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xff777777),
                          fontSize: ScreenUtil().setSp(37),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }

  Widget _getMyStudy(){
    return Container(
      height: ScreenUtil().setHeight(240*_lines),
      padding: EdgeInsets.only(top:12,left: 15,right: 15,bottom: 20),
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 4,
        physics: NeverScrollableScrollPhysics(),
        children: _getItems(),
      ),
    );

  }

  List<Widget> _getItems(){
    List<Widget> items = [];
    dataList.forEach((element) {
      items.add(_getItem(element));
    });
    return items;
  }

  Widget _getItem(ModuleItem item){
    return Column(
      children: [
        Image.asset(item.img,
          height: ScreenUtil().setHeight(66),
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          item.name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(37),
            color: Color(0xff2A2B2B)
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getUserInfo(),
        Container(
          height: ScreenUtil().setHeight(29),
          color: Color(0xffF7F7F7),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(43)),
          height: ScreenUtil().setHeight(80),
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: Text(
            "我的学习",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(43),
              color: Color(0xff222222),
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        _getMyStudy(),
      ],
    );
  }

}