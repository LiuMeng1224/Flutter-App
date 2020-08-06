
import 'package:ECEIBS/model/PlanItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

// ignore: must_be_immutable
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
      _planList.add(PlanItem("4295","2.10号计划","","2020.02.10","2022.11.05",50));
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
              fontSize: 18,
              color: Color(0xff222222),
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: _viewAll,
            child: Text(
              "查看全部 >",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7f8485)
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
                      color: Color(0xff222222),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    item.valid_start_time+" - "+item.valid_end_time,
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
          _getStateWidget(item.finish_progress),
        ],
      ),
    );
  }

  Widget _getStateWidget(int progress){

    if(progress==0 || progress == 100){
      return Container(
        width: ScreenUtil().setWidth(90),
        height: ScreenUtil().setWidth(90),
        alignment: Alignment.center,
        decoration: _getDecoration(progress),
        child: Text(
          progress==100?"已完成":"未开始",
          style: TextStyle(
              color: progress==100?Color(0xff009900):Color(0xff222222),
              fontSize: 10
          ),
        ),
      );
    }else{
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(90),
            height: ScreenUtil().setWidth(90),
            alignment: Alignment.center,
            decoration: _getDecoration(progress),
            child: Text(
              "$progress%",
              style: TextStyle(
                  color: Color(0xff005587),
                  fontSize: 12
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(90),
            height: ScreenUtil().setWidth(90),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: progress/100.0,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xff005587)),
              backgroundColor: Color(0x50dddddd),
            ),
          ),
        ],
      );
    }
  }

  //获取计划图片
  Widget _getImage(String image){
    return image.isEmpty?Container(
      width: ScreenUtil().setWidth(280),
      height: ScreenUtil().setHeight(160),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage("assets/images/icon_plan_default.jpg"),
          fit: BoxFit.cover,
        )
      ),
    ):Container(
      width: ScreenUtil().setWidth(280),
      height: ScreenUtil().setHeight(160),
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
          color:Color(0xffeeeeee),
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
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: _getPlanList(),
      ),
    );
  }
}