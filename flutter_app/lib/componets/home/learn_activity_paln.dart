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
  double _itemWidth = 0.0;
  double _itemImageHeight = 0.0;
  int styleType = 6; //1、左图右文or左文右图-整体卡片 2、左图右文or左文右图-无边式 3、左图右文or左文右图-单独卡片 4、左图右文or左文右图-横向布局
  // 5、小图-无边式 6、小图横向-item卡片式 7、小图-item卡片式 8、小图-整体卡片式

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
      case 4:
        return _getTransverseView();
        break;
      case 5:
        _itemWidth = (ScreenUtil.screenWidth - ScreenUtil().setWidth(44)*3)/2;
        _itemImageHeight = ScreenUtil().setHeight(337);
        return _getSmallImageWrap();
        break;
      case 6:
        _itemWidth = ScreenUtil.screenWidth*0.4;
        _itemImageHeight = ScreenUtil().setHeight(289);
        return _getTransverseView();
        break;
      case 7:
        _itemWidth = (ScreenUtil.screenWidth - ScreenUtil().setWidth(44)*3)/2;
        _itemImageHeight = ScreenUtil().setHeight(337);
        return _getSmallImageWrap();
        break;
      case 8:
        _itemWidth = (ScreenUtil.screenWidth - ScreenUtil().setWidth(29)*3-ScreenUtil().setWidth(44)*2)/2;
        _itemImageHeight = ScreenUtil().setHeight(322);
        return _getAllCardView();
        break;
      default:
        return _getNoBorderView();
        break;
    }
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

  //整体卡片
  Widget _getWarpCardView(){
    return Column(
      children: [
        _listHeader(),
        Card(
          elevation: ScreenUtil().setWidth(4),
          shadowColor: Color(0xff434343),
          margin: EdgeInsets.all(44),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15)))
          ),
          child: Column(
            children: _getPlanList(),
          ),
        ),
      ],
    );
  }

  //小图-整体卡片式
  Widget _getAllCardView(){
    return Column(
      children: [
        _listHeader(),
        Card(
          elevation: ScreenUtil().setWidth(4),
          shadowColor: Color(0xff434343),
          margin: EdgeInsets.only(top: ScreenUtil().setWidth(44)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15)))
          ),
          child: _getSmallImageWrap(),
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
          margin: EdgeInsets.all(ScreenUtil().setWidth(40)),
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
    return Column(
      children: [
        _listHeader(),
        Container(
          height: styleType==6?ScreenUtil().setHeight(581):ScreenUtil().setHeight(330),
          margin: EdgeInsets.all(ScreenUtil().setWidth(44)),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _getPlanList(),
          ),
        ),
      ],
    );
  }

  //小图式外部外部布局
  Widget _getSmallImageWrap(){
    return styleType==8?
        Container(
          alignment: Alignment.center,
          width: ScreenUtil.screenWidth-ScreenUtil().setWidth(44)*2,
          color: Colors.white,
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(29),bottom:ScreenUtil().setWidth(29)),
          child: Column(
            children: [
              Wrap(
                spacing: styleType==5?ScreenUtil().setWidth(44):ScreenUtil().setWidth(20),
                runSpacing: styleType==5?ScreenUtil().setWidth(72):ScreenUtil().setWidth(44),
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                children: _getPlanList(),
              ),
            ],
          ),
        ) :
    Column(
      children: [
        _listHeader(),
        SizedBox(height: ScreenUtil().setHeight(44),),
        Wrap(
          spacing: styleType==5?ScreenUtil().setWidth(44):ScreenUtil().setWidth(20),
          runSpacing: styleType==5?ScreenUtil().setWidth(72):ScreenUtil().setWidth(30),
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          children: _getPlanList(),
        ),
      ],
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
        widgetList.add(_leftImageLeftTextItem());
        widgetList.add(_leftImageLeftTextItem());
        break;
      case 3:
        widgetList.add(_getCardItem());
        widgetList.add(SizedBox(height: ScreenUtil().setHeight(20),));
        widgetList.add(_getCardItem());
        break;
      case 4:
        widgetList.add(_getHorizontalCardItem());
        widgetList.add(SizedBox(width: ScreenUtil().setWidth(10),));
        widgetList.add(_getHorizontalCardItem());
        break;
      case 5:
        widgetList.add(_getSmallImageItem(0));
        widgetList.add(_getSmallImageItem(1));
        widgetList.add(_getSmallImageItem(2));
        break;
      case 6:
        widgetList.add(_getCardItem());
        widgetList.add(SizedBox(width: ScreenUtil().setWidth(10),));
        widgetList.add(_getCardItem());
        widgetList.add(SizedBox(width: ScreenUtil().setWidth(10),));
        widgetList.add(_getCardItem());
        break;
      case 7:
        widgetList.add(_getCardItem());
        widgetList.add(_getCardItem());
        widgetList.add(_getCardItem());
        break;
      case 8:
        widgetList.add(_getSmallImageItem(0));
        widgetList.add(_getSmallImageItem(1));
        widgetList.add(_getSmallImageItem(2));
        break;
      default:
        break;
    }
    return widgetList;
  }

  //横向卡片布局item
  Widget _getHorizontalCardItem(){
    return Card(
      elevation: ScreenUtil().setWidth(4),
      shadowColor: Color(0xff434343),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15)))
      ),
      child: SizedBox(
        width: ScreenUtil.screenWidth*0.8,
        child: _leftTextRightImage(),
      ),
    );
  }


  //卡片item+
  Widget _getCardItem(){
    return Card(
      elevation: ScreenUtil().setWidth(4),
      shadowColor: Color(0xff434343),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15)))
      ),
      child: _getSmallImageItem(0),
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

  //左文右图布局
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
      case 4:
        return EdgeInsets.all(ScreenUtil().setWidth(29));
      case 5:
        return EdgeInsets.only(top: ScreenUtil().setWidth(22));
        break;
      case 6:
        return EdgeInsets.only(left: ScreenUtil().setWidth(21),right: ScreenUtil().setWidth(21),top: ScreenUtil().setWidth(28),bottom: ScreenUtil().setWidth(31));
        break;
      case 7:
        return EdgeInsets.only(left: ScreenUtil().setWidth(29),right: ScreenUtil().setWidth(29),top: ScreenUtil().setWidth(22),bottom: ScreenUtil().setWidth(29));
        break;
      case 8:
        return EdgeInsets.only(top: ScreenUtil().setWidth(22));
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
                SizedBox(height: ScreenUtil().setHeight(5),),
                Text(
                  "2020.03.22~2020.03.30",
                  maxLines: 1,
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


  //小图 无边item
  Widget _getSmallImageItem(int index){

    return Column(
      children: [
        _getSmallImageView(""),
        _getSmallImageTextView(index),
      ],
    );
  }


  //小图-图片布局
  Widget _getSmallImageView(String img){
    return Container(
      width: _itemWidth,
      height: _itemImageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(ScreenUtil().setWidth(8)),topRight:Radius.circular(ScreenUtil().setWidth(8))),
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
            top: (_itemImageHeight-ScreenUtil().setWidth(124))/2,
            left: (_itemWidth-ScreenUtil().setWidth(124))/2,
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
                width: _itemWidth,
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
          Positioned(//计划进度文字
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
  Widget _getSmallImageTextView(int index){
    return Container(
      width: _itemWidth,
      height: ScreenUtil().setHeight(266),
      padding: _getPadding(),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index==0?"设计工作上最重要的是针对人们习以为常，认为理所当然，势力扩大飞机萨拉丁开发手动阀手动阀":"无敌于天下",
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xff222222),
                  fontSize: ScreenUtil().setSp(41),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(5),),
              Text(
                "2020.03.22~2020.03.30",
                maxLines: 1,
                style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: ScreenUtil().setSp(35)
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
    );
  }
}