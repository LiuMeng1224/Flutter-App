import 'package:ECEIBS/model/ModuleItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class NavigatorModule extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return NavigatorModuleState();
  }

}

class NavigatorModuleState extends State<NavigatorModule>{

  int lines = 1;
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
    if(moduleList.length%5 > 0){
      lines = result.toInt() +1;
    }else{
      lines = result.toInt();
    }
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

    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10,top:5),
      child: GestureDetector(
        onTap: (){

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              item.img,
              width: ScreenUtil().setWidth(72),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(3),
            ),
            Text(
              item.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: Color(0xff222222),
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
      height: ScreenUtil().setHeight(160)*lines,
      margin: EdgeInsets.only(top: 10),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          children: _buildItems(),
      ),
    );
  }

}