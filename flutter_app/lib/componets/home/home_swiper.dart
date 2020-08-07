import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//首页图文广告模块
class HomeSwiper extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeSwiperState();
  }
}

class HomeSwiperState extends State<HomeSwiper>{

  List<String> imageList = ["https://img.eceibs.net/image/zo/06a38c6885844cb682afe19a143a4f89.jpg?x-oss-process=image/resize,w_750,h_328,m_fill,limit_0/quality,q_50","https://img.eceibs.net/image/zo/be41fad90a2d49daa4d9b4b86bedb81c.jpg?x-oss-process=image/resize,w_750,h_328,m_fill,limit_0/quality,q_50"];

  @override
  Widget build(BuildContext context) {
    return _getImages(true);
  }

  //轮播图
  Widget _getSwiper(bool isHasPadding){
    return Container(
      height: ScreenUtil().setHeight(400),
      padding: isHasPadding?EdgeInsets.all(15):null,
      color: Colors.white,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network(
            "https://img.eceibs.net/image/zo/06a38c6885844cb682afe19a143a4f89.jpg?x-oss-process=image/resize,w_750,h_328,m_fill,limit_0/quality,q_50",
            fit: BoxFit.cover,
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(builder: DotSwiperPaginationBuilder(activeColor:Colors.white,color: Color(0x50ffffff),size: 7,activeSize: 7,)),
        autoplay: true,
        autoplayDelay: 2000,
        onTap: (index){
          print("Swiper-ontap=====$index");
        },
      ),
    );
  }

  //图片
  Widget _getImages(bool isHasPadding){
    double space = ScreenUtil().setWidth(30);
    double imgWidth = isHasPadding?(ScreenUtil.screenWidth-space*(imageList.length+1))/imageList.length:ScreenUtil.screenWidth/imageList.length;
    double imgHeight = imgWidth*(328/750);
    double contentHeight = isHasPadding?imgHeight+space*2:imgHeight;
    return Container(
        height: contentHeight,
        padding: isHasPadding?EdgeInsets.only(top:space,bottom:space):null,
        color: Colors.white,
        child: Row(
          children: _getImageItems(isHasPadding,space,imgWidth,imgHeight),
        ),
    );
  }

  List<Widget> _getImageItems(bool isHasPadding,double space,double width,double height){
    List<Widget> widgetList = [];
    imageList.forEach((element) {
      if(isHasPadding){
        widgetList.add(SizedBox(width: space,));
      }
      widgetList.add(
        Expanded(
          child: GestureDetector(
            onTap: _onImageItemClick,
            child: Image.network(
              element,
              width: width,
              height: height,
              alignment: Alignment.topCenter,
              fit: BoxFit.fill,
            ),
          ),
        )
      );
    });
    if(isHasPadding){
      widgetList.add(SizedBox(width: space,));
    }
    return widgetList;
  }

  void _onImageItemClick(){

  }
}