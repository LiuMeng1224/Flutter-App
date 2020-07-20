
import 'package:ECEIBS/model/ModuleItem.dart';
import 'package:flutter/material.dart';

class NavigatorModule extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return NavigatorModuleState();
  }

}

class NavigatorModuleState extends State<NavigatorModule>{

  List<ModuleItem> moduleList = [];

  @override
  void initState() {
    super.initState();
    moduleList.add(ModuleItem("学习营","Study Camp","studyCamp","学习营"));
    moduleList.add(ModuleItem("选修库","Optional Course","select","选修库"));
    moduleList.add(ModuleItem("知识汇","Content Center","knowledge","知识汇"));
    moduleList.add(ModuleItem("作业墙","Assignment","homeworkWall","作业墙"));
    moduleList.add(ModuleItem("到期啦","Due to End","toBeEndNotification","到期啦"));
  }


  List<Widget> _buildItems(){
    List<Widget> items = [];

    moduleList.forEach((element) {
      var img = "";
      switch(element.id){
        case "studyCamp":
          img = "assets/images/navigator_learningcamp.webp";
          break;
        case "select":
          img = "assets/images/navigator_elective.webp";
          break;
        case "knowledge":
          img = "assets/images/navigator_knowledge.webp";
          break;
        case "homeworkWall":
          img = "assets/images/navigator_homework.png";
          break;
        case "toBeEndNotification":
          img = "assets/images/navigator_deadline.webp";
          break;
        default:
          img = "assets/images/navigator_learningcamp.webp";
          break;
      }

      items.add(Padding(
        padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
        child: GestureDetector(
          onTap: (){

          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(img,
                width: 38,
                height: 38,),
              SizedBox(
                height: 6,
              ),
              Text(
                element.name,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: Color(0xff252631),
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ));
    });

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Color(0xffffffff),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildItems(),
      ),
    );
  }

}