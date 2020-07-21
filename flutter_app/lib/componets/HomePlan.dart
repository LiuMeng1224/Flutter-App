
import 'package:ECEIBS/model/PlanItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HomePlan extends StatefulWidget{

  int planType = 1;//1、选修  2、必修

  HomePlan(this.planType);

  @override
  State<StatefulWidget> createState() {
    return HomePlanState(planType);
  }
}

class HomePlanState extends State<HomePlan>{
  int planType = 1;//1、选修  2、必修
  List<PlanItem> _planList = [];

  HomePlanState(this.planType);

  @override
  void initState(){
    super.initState();
    _getData();
  }

  _getData() async{
    if(planType == 1){
      _planList.add(PlanItem("4824","打印课件测试1","","2020.04.21","2023.04.14",100));
      _planList.add(PlanItem("4295","2.10号计划","","2020.02.10","2022.11.05",10));
    }else{
      _planList.add(PlanItem("4634","测试计划123","","2020.04.02","2026.04.03",0));
      _planList.add(PlanItem("3845","全类型选修计划","https://img.test.eceibs.net/image/a1/541c08bccae04c2eab0d0f3ef0f7c616.jpg?x-oss-process=image/resize,w_280,h_158,m_fill,limit_0/quality,q_50","2019.08.27","2022.07.05",5));
    }
    setState(() {
    });
  }

  //计划头部布局
  Widget _getHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            planType==1?"选修计划":"必修计划",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff252631),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: _viewAll,
            child: Text(
              "全部",
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff005587)
              ),
            ),
          ),
        )
      ],
    );
  }

  _viewAll(){

  }

  //创建计划item
  Widget _buildPlanItem(PlanItem item){
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15,top:10,bottom: 10),
      child: Row(
        children: [
          _getImage(item.trainplan_img),
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
                    child:Row(
                      children: [
                        Image.asset("assets/images/icon_course_online.webp",width: 12,height: 10,),
                        SizedBox(width: 3,),
                        Text(
                          "在线",
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xff005587),
                            fontSize: 10,
                          ),
                        )
                      ],
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

  //获取计划图片
  Widget _getImage(String image){
    return image.isEmpty?Container(
      width: ScreenUtil().setWidth(240),
      height: ScreenUtil().setHeight(140),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage("assets/images/icon_plan_default.jpg"),
          fit: BoxFit.cover,
        )
      ),
    ):Container(
      width: ScreenUtil().setWidth(240),
      height: ScreenUtil().setHeight(140),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          )
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

  List<Widget> _getPlanList(){
    List<Widget> widgetList = [];
    widgetList.add(SizedBox(height: ScreenUtil().setHeight(10),));
    widgetList.add(_getHeader());
    _planList.forEach((element) {
      widgetList.add(_buildPlanItem(element));
    });

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: _getPlanList(),
      ),
    );
  }
}