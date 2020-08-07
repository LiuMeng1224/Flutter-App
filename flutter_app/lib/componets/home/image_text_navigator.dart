import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ECEIBS/model/ModuleItem.dart';

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
  List<ModuleItem> moduleList = [];

  @override
  void initState() {
    super.initState();

    _getData();
  }

  _getData() async{
    moduleList.add(ModuleItem("学习营","Study Camp","studyCamp","学习营","assets/images/navigator_learningcamp.webp"));
    moduleList.add(ModuleItem("选修库","Optional Course","select","选修库","assets/images/navigator_elective.webp"));
    moduleList.add(ModuleItem("知识汇","Content Center","knowledge","知识汇","assets/images/navigator_knowledge.webp"));
    moduleList.add(ModuleItem("作业墙","Assignment","homeworkWall","作业墙","assets/images/navigator_homework.png"));
    moduleList.add(ModuleItem("直播","Assignment","id","直播","assets/images/navigator_deadline.webp"));
    moduleList.add(ModuleItem("到期啦","Due to End","toBeEndNotification","到期啦","assets/images/navigator_deadline.webp"));
    double result = moduleList.length/5.0;
    lines = moduleList.length%5>0 ? result.toInt() +1:result.toInt();
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

  Widget _getNavigatorItem(ModuleItem item){

    return Container(
      width: itemWidth,
      child: GestureDetector(
        onTap: (){

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
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