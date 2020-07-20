
import 'package:ECEIBS/model/PlanItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePlan extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HomePlanState();
  }
}

class HomePlanState extends State<HomePlan>{
  int _clickIndex = 0;
  List<PlanItem> _compulsoryList = [];
  List<PlanItem> _electiveList = [];

  @override
  void initState(){
    super.initState();

    _compulsoryList.add(PlanItem("4824","打印课件测试1","","2020.04.21","2023.04.14",100));
    _compulsoryList.add(PlanItem("4295","2.10号计划","","2020.02.10","2022.11.05",10));

    _electiveList.add(PlanItem("4634","测试计划123","","2020.04.02","2026.04.03",0));
    _electiveList.add(PlanItem("3845","全类型选修计划","https://img.test.eceibs.net/image/a1/541c08bccae04c2eab0d0f3ef0f7c616.jpg?x-oss-process=image/resize,w_280,h_158,m_fill,limit_0/quality,q_50","2019.08.27","2022.07.05",5));

  }
  //创建计划列表
  List<Widget> _buildPlanView(int type){
    List<Widget> items = [];
    if(type==1){
      _compulsoryList.forEach((element) {
        items.add(_buildPlanItem(element));
        items.add(SizedBox(height: 1,child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffeeeeee)),
        ),));
      });
    }else{
      _electiveList.forEach((element) {
        items.add(_buildPlanItem(element));
        items.add(SizedBox(height: 1,child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xffeeeeee)),
        ),));
      });
    }
    return items;
  }

  //计划头部布局
  Widget _getHeader(){
    return Row(
      children: [
        _compulsoryList.length>0?Expanded(
          child: GestureDetector(
            onTap: (){
              _clickIndex = 0;
              setState(() {
              });
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              color: _clickIndex==0? Color(0xffffffff):Color(0xfff6f6f6),
              child: Text(
                "必修",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff252631),
                  fontSize:15,
                ),
              ),
            ),
          ),
        ):null,
        _electiveList.length>0?Expanded(
          child: GestureDetector(
            onTap: (){
              _clickIndex = 1;
              setState(() {

              });
            },
            child: Container(
              height: 40,
              alignment: Alignment.center,
              color: _clickIndex==1? Color(0xffffffff):Color(0xfff6f6f6),
              child: Text(
                "选修",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff252631),
                  fontSize:15,
                ),
              ),
            ),
          ),
        ):null,
      ],
    );
  }

  //计划底部布局
  Widget _getFooter(){
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Text(
        "查看更多>",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff005587),
          fontSize: 14,
        ),
      ),
    );
  }

  //创建计划item
  Widget _buildPlanItem(PlanItem item){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15,right: 15,top:10,bottom: 10),
      child: Row(
        children: [
          Column(
            children: [
              item.trainplan_img.isNotEmpty?Image.network(
                item.trainplan_img,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ):Image.asset("assets/images/icon_plan_default.jpg",width: 120,height: 70,fit: BoxFit.cover,),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: 120,
                  height: 4,
                  child: LinearProgressIndicator(
                    value: item.finish_progress.toDouble(),
                    backgroundColor: Color(0xffE2E4E6),
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xff5BA3D7)),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.trainplan_name,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff252631),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    item.valid_start_time+"-"+item.valid_end_time,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff7f8485),
                      fontSize: 12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child:Text(
                      "包含3个阶段",
                      maxLines: 1,
                      style: TextStyle(
                        color: Color(0xff005587),
                        fontSize: 11,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: _getDecoration(item.finish_progress),
            child: Text(
              item.finish_progress==100?"已完成":"未完成",
              style: TextStyle(
                color: item.finish_progress==100?Color(0xff009900):Color(0xff252631),
                fontSize: 10
              ),
            ),
          ),
        ],
      ),
    );
  }

  //计划完成状态
  BoxDecoration _getDecoration(int progress){
    if(progress==100){
      return BoxDecoration(
          color:Colors.white,
        borderRadius: BorderRadius.circular(23),
        border: Border.all(
          color: Color(0xff009900),
          width: 1
        )
      );
    }else{
      return BoxDecoration(
          color:Color(0xffF7F8F9),
          borderRadius: BorderRadius.circular(23),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          _getHeader(),
          IndexedStack(
            index: _clickIndex,
            children: [
              Column(
                children: _buildPlanView(1),
              ),
              Column(
                children: _buildPlanView(2),
              ),
            ],
          ),
          _getFooter(),
        ],
      ),
    );
  }
}