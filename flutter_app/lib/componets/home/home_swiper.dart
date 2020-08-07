import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeSwiperState();
  }


}

class HomeSwiperState extends State<HomeSwiper>{

  @override
  Widget build(BuildContext context) {

    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(400),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: _goDetail,
            child: Image.network(
              "https://img.eceibs.net/image/zo/06a38c6885844cb682afe19a143a4f89.jpg?x-oss-process=image/resize,w_750,h_328,m_fill,limit_0/quality,q_50",
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(),
      ),
    );
  }

  void _goDetail(){

  }
}