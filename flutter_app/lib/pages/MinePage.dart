import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MinPageState();
  }

}

class MinPageState extends State<MinePage>{

  List<String> mineList = ["assets/images/card_mine.webp","assets/images/card_mine.webp","assets/images/card_mine.webp","assets/images/card_mine.webp","assets/images/card_mine.webp"];

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _getViewList(){
    List<Widget> widgetList = [];
    mineList.forEach((element) {
      widgetList.add(InkWell(
        onTap: (){
          print("点击了$element");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              element,
              width: 30,
              height: 30,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "学习轨迹",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff7f8485),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ));
    });
    return widgetList;
  }

  Widget _getTotalDataView(){

    return Positioned(
      top: 200,
      left: 80,
      child: Container(
        width: MediaQuery.of(context).size.width-160,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xffD5E7F8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xff005587),
            width: 1
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "学分：",
              style: TextStyle(
                color: Color(0xff7F8485),
                fontSize: 11
              ),
            ),
            Text(
              "1111",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xff005587),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 1,
              height: 26,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xffdddddd)
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "积分：",
              style: TextStyle(
                  color: Color(0xff7F8485),
                  fontSize: 11
              ),
            ),
            Text(
              "222",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Color(0xff005587),
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon_mine_bg.webp"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/icon_default_head.png",
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "cs5",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 320,
              child: GridView.count(
                padding: EdgeInsets.only(left: 15,right: 15,top:30,),
                crossAxisCount: 4,
                children: _getViewList(),
              ),
            ),

          ],
        ),
        _getTotalDataView(),
      ],
    );
  }

}