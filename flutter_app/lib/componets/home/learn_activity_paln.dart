import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
//学习活动-计划组件
class LearnActivityPlan extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return LearnActivityPlanState();
  }

}

class LearnActivityPlanState extends State<LearnActivityPlan>{
  int styleType = 3; //1、左图右文or左文右图-整体卡片 2、左图右文or左文右图-无边式 3、左图右文or左文右图-单独卡片

  @override
  Widget build(BuildContext context) {

    switch(styleType){
      case 0:
        return _getNoBorderView();
        break;
      case 1:
        return _getWarpCardView();
        break;
      case 2:
        return _getNoBorderView();
        break;
      case 3:
        return _getItemCardView();
        break;
      default:
        return _getNoBorderView();
        break;
    }
  }

  //整体卡片
  Widget _getWarpCardView(){
    return Column(
      children: [
        _listHeader(),
        Card(
          elevation: ScreenUtil().setWidth(4),
          shadowColor: Color(0xff434343),
          margin: EdgeInsets.all(ScreenUtil().setWidth(44)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Column(
            children: _getPlanList(),
          ),
        ),
      ],
    );
  }

  //单独卡片式
  Widget _getItemCardView(){
    return Column(
      children: [
        _listHeader(),
        Container(
          color: Colors.white,
          margin: EdgeInsets.all(ScreenUtil().setWidth(44)),
          child: Column(
            children: _getPlanList(),
          ),
        ),
      ],
    );
  }

  //无边式
  Widget _getNoBorderView(){
    return Container(
      color: Colors.white,
      child: Column(
        children: _getPlanList(),
      ),
    );
  }

  //横向布局
  Widget _getTransverseView(){
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(44)),
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _getPlanList(),
      ),
    );
  }

  //小图式外部外部布局
  Widget _getSmallImageWrap(){
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.start,
      children: _getPlanList(),
    );
  }

  List<Widget> _getPlanList(){
    List<Widget> widgetList = [];
    switch(styleType){
      case 0:
        widgetList.add(_listHeader());
        widgetList.add(_leftImageLeftTextItem());
        widgetList.add(_leftImageLeftTextItem());
        break;
      case 1:
        widgetList.add(_leftImageLeftTextItem());
        widgetList.add(_leftImageLeftTextItem());
        break;
      case 2:
        widgetList.add(_listHeader());
        break;
      case 3:
        widgetList.add(_getCardItem());
        widgetList.add(SizedBox(height: ScreenUtil().setHeight(20),));
        widgetList.add(_getCardItem());
        break;
      default:
        break;
    }
    return widgetList;
  }

  //计划标题
  Widget _listHeader(){
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(44)),
            child: Text(
              "学习计划",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(49),
                  color: Color(0xff222222),
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(44)),
            child: InkWell(
              onTap: (){},
              child: Row(
                children: [
                  Text(
                    "查看全部",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(38),
                        color: Color(0xff999999)
                    ),
                  ),
                  SizedBox(width: 2,),
                  Image.asset("assets/images/home/icon_plan_more.png",width: ScreenUtil().setWidth(20),height: ScreenUtil().setWidth(35),fit: BoxFit.fill,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //卡片item
  Widget _getCardItem(){
    return Card(
      child: _leftTextRightImage(),
    );
  }

  //左图右文
  Widget _leftImageLeftTextItem(){
    return Padding(
      padding: _getPadding(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getImageView(""),
          SizedBox(width: ScreenUtil().setWidth(38),),
          _getTextView(),
        ],
      ),
    );
  }

  //作文有图布局
  Widget _leftTextRightImage(){
    return Padding(
      padding: _getPadding(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTextView(),
          SizedBox(width: ScreenUtil().setWidth(38),),
          _getImageView(""),
        ],
      ),
    );
  }

  EdgeInsetsGeometry _getPadding(){
    switch(styleType){
      case 1:
        return EdgeInsets.only(left: ScreenUtil().setWidth(29),right: ScreenUtil().setWidth(29),top: ScreenUtil().setWidth(36),bottom: ScreenUtil().setWidth(36));
        break;
      case 2:
        return EdgeInsets.only(left: ScreenUtil().setWidth(44),right: ScreenUtil().setWidth(44),top: ScreenUtil().setWidth(36),bottom: ScreenUtil().setWidth(36));
        break;
      case 3:
        return EdgeInsets.all(ScreenUtil().setWidth(29));
        break;
      default:
        return EdgeInsets.only(left: ScreenUtil().setWidth(44),right: ScreenUtil().setWidth(44),top: ScreenUtil().setWidth(36),bottom: ScreenUtil().setWidth(36));
        break;
    }
  }

  //图片view
  Widget _getImageView(String img){
    return Container(
      width: ScreenUtil().setWidth(346),
      height: ScreenUtil().setHeight(245),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8))),
        image: DecorationImage(
          image: img.isEmpty?AssetImage("assets/images/icon_plan_default.jpg"):NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(//计划未开始状态
            left: 0,
            top: 0,
            child: Offstage(
              offstage: true,
              child: SizedBox(
                height: ScreenUtil().setWidth(51),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(0xdd99A9B2),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8)))
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 3,right: 3),
                    child: Text(
                      "未开始",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(32),
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
          Positioned(//计划剩余天数
            left: 0,
            top: 0,
            child: Offstage(
              offstage: true,
              child: SizedBox(
                height: ScreenUtil().setWidth(51),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(0xddFF4444),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8)))
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 3,right: 3),
                    child: Text(
                      "剩余7天",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(32),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(//计划收藏标签
            right: 0,
            top: 0,
            child: Offstage(
              offstage: false,
              child: SizedBox(
                height: ScreenUtil().setWidth(51),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(0x50000000),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8)))
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 3,right: 3),
                    child: Row(
                      children: [
                        Text(
                          "51",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(32),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Image.asset("assets/images/home/icon_collect_plan.png",width: ScreenUtil().setWidth(32),height: ScreenUtil().setHeight(29),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(//计划过期状体
            top: ScreenUtil().setWidth(60),
            left: ScreenUtil().setWidth(110),
            child: Offstage(
              offstage: false,
              child: SizedBox(
                width: ScreenUtil().setWidth(124),
                height: ScreenUtil().setWidth(124),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0x50000000),
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(62))),
                  ),
                  child: Center(
                    child: Text(
                      "已过期",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(32)
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(//计划进度
            left: 0,
            bottom: 0,
            child: Offstage(
              offstage: false,
              child:SizedBox(
                width: ScreenUtil().setWidth(346),
                height: ScreenUtil().setWidth(9),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8))),
                  ),
                  child: LinearProgressIndicator(
                    value: 50/100.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff005587)),
                    backgroundColor: Color(0xaa000000),
                  ),
                ),
              ),
            ),
          ),
          Positioned(//计划进度
            right: ScreenUtil().setWidth(15),
            bottom: ScreenUtil().setHeight(15),
            child: Text(
              "50%",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(29)
              ),
            ),
          ),
        ],
      ),
    );
  }

  //文案view
  Widget _getTextView(){
    return Expanded(
      child: SizedBox(
        height: ScreenUtil().setHeight(245),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "设计工作上最重要的是针对人们习以为常，认为理所当然，势力扩大飞机萨拉丁开发手动阀手动阀",
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: ScreenUtil().setSp(47),
                      fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(12),),
                Text(
                  "2020.03.22~2020.03.30",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: ScreenUtil().setSp(38)
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Offstage(
                    offstage: false,
                    child: SizedBox(
                      height: ScreenUtil().setWidth(49),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color(0x2000709D),
                              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8)))
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 3,right: 3),
                            child: Text(
                              "在线",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff00709D),
                                fontSize: ScreenUtil().setSp(32),
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(14),),
                  Offstage(
                    offstage: false,
                    child: SizedBox(
                      height: ScreenUtil().setWidth(49),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color(0x2000709D),
                              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(8)))
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 3,right: 3),
                            child: Text(
                              "面授",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff00709D),
                                fontSize: ScreenUtil().setSp(32),
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Offstage(
                offstage: false,
                child: Text(
                  "必修",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff00709D),
                    fontSize: ScreenUtil().setSp(38),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}