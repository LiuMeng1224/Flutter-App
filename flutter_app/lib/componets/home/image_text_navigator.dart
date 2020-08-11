import 'dart:convert';

import 'package:ECEIBS/http/api.dart';
import 'package:ECEIBS/http/request.dart';
import 'package:ECEIBS/model/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//图文导航组件
class ImageTextNavigator extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ImageTextNavigatorState();
  }
}

class ImageTextNavigatorState extends State<ImageTextNavigator>{

  int lines = 1;//显示行数
  int crossCount = 2; //每行显示的个数
  double itemWidth = 0; //每个item的宽度
  List<NavModules> moduleList = [];

  @override
  void initState() {
    super.initState();

    _getData();
  }

  _getData() async{

    var resultString = await postRequest(API.HOME_MODULES,formData: {"test":"123"});
    var dataMap = json.decode(resultString.toString());
    moduleList = dataMap['result']['nav_modules'].map<NavModules>((item)=> NavModules.fromJson(item)).toList();
    double temp = moduleList.length/5.0;
    lines = moduleList.length%5>0 ? temp.toInt() +1:temp.toInt();
    crossCount = moduleList.length>5 ? 5 : moduleList.length;
    itemWidth = ScreenUtil.screenWidth/crossCount;

    setState(() {

    });
  }


  List<Widget> _buildItems(){
    List<Widget> items = [];
    moduleList.forEach((element) {
      items.add(_getNavigatorItem(element));
    });
    return items;
  }

  Widget _getNavigatorItem(NavModules item){

    return Container(
      width: itemWidth,
      child: GestureDetector(
        onTap: (){

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            item.img.isEmpty?
            Image.asset(
              "assets/images/navigator_learningcamp.webp",
              width: ScreenUtil().setWidth(60),
            ):
            Image.network(
              item.img,
              width: ScreenUtil().setWidth(60),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(6),
            ),
            Text(
              item.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: ScreenUtil().setHeight(100)*lines+ScreenUtil().setHeight(30)*(lines+1),
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Wrap(
        alignment: WrapAlignment.start,
        children: _buildItems(),
        runSpacing: ScreenUtil().setHeight(30),
      ),
    );
  }
}