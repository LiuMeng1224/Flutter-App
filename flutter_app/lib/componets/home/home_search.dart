import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ECEIBS/provider/message_counter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/screenutil.dart';

//首页顶部搜索框
class HomeSearch extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              height: ScreenUtil().setHeight(78),
              padding: EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/home/icon_home_search.png",width: ScreenUtil().setWidth(37),height: ScreenUtil().setWidth(37),),
                    SizedBox(width: 5,),
                    Text(
                      "搜索课程/培训计划/学习",
                      style: TextStyle(
                        color: Color(0xffBBBBBB),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: (){
            },
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/home/icon_home_message.png",
                  width: ScreenUtil().setWidth(57),
                  height: ScreenUtil().setWidth(57),
                ),
                _getUnreadLabel(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //消息未读显示小红点
  Widget _getUnreadLabel(BuildContext context){
    if(context.watch<MessageCounter>().unreadMessageCount>0){
      return Positioned(
        top:0,
        right: 0,
        child: SizedBox(
          width: ScreenUtil().setWidth(20),
          height: ScreenUtil().setWidth(20),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Color(0xffFF5050),
                borderRadius:BorderRadius.all(Radius.circular(5))
            ),
          ),
        ),
      );
    }else{
      return SizedBox(width: 0,height: 0,);
    }
  }
}