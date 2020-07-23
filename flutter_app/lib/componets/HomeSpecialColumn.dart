
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:video_player/video_player.dart';

//专栏
class HomeSpecialColumn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeSpecialColumnState();
  }

}

class HomeSpecialColumnState extends State<HomeSpecialColumn>{


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _getHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "视频专栏",
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
              "全部",
              style: TextStyle(
                  fontSize: 16,
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


  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          _getHeader(),
          SizedBox(
            height: 1,
          ),
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(30),right: ScreenUtil().setWidth(30),top:10),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                        "https://img.test.eceibs.net/image/ceibs/178c1f717944409e9bbd25117b58abb9.jpg?x-oss-process=image/resize,w_690,h_388,m_fill,limit_0/quality,q_50",
                      width: ScreenUtil().setWidth(690),
                      height: ScreenUtil().setHeight(360),
                        fit: BoxFit.cover,
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child:Image.asset(
                        "assets/images/icon_player_start.png",
                        width: ScreenUtil().setWidth(90),
                        height: ScreenUtil().setWidth(90),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}