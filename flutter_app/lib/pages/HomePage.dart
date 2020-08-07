import 'package:ECEIBS/componets/home/home_swiper.dart';
import 'package:ECEIBS/componets/home/image_text_navigator.dart';
import 'package:ECEIBS/provider/message_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ECEIBS/componets/HomeBanner.dart';
import 'package:ECEIBS/componets/HomePlan.dart';
import 'package:ECEIBS/componets/HomeSpecialColumn.dart';
import 'package:ECEIBS/componets/NavigatorModule.dart';

//首页
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  List<String> _moduleList = ["banner","navigator","swiper_test","elective plan","compulsory plan","video","project"];
  ScrollController _controller = ScrollController();
  bool _isLoading = false; // 是否正在请求数据中
  bool _hasMore = true; // 是否还有更多数据可加载

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      //如果下拉的当前位置到scroll的最下面
      if(_controller.position.pixels==_controller.position.maxScrollExtent){
        _getMoreData();
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  //获取更多
  _getMoreData(){

  }

  Future<Null> _handleRefresh() async{
    _isLoading = true;
    var data = await _getData();
    if(this.mounted){
      setState(() {
        _isLoading = false;
        return null;
      });
    }
  }

  //模拟调用网络接口
  Future<List> _getData()=> Future.delayed(Duration(seconds: 3),(){
      return [];
    });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RefreshIndicator(
          child: ListView.builder(
            itemCount: _moduleList.length,
            itemBuilder: (context,index){
              switch(_moduleList[index]){
                case "banner": //轮播图
                  return HomeBanner();
                  break;
                case "navigator": //导航
                  return NavigatorModule();
                  break;
                case "swiper_test": //
                  return ImageTextNavigator();
                  break;
                case "elective plan": //选修计划
                  return HomePlan(1);
                  break;
                case "compulsory plan": //必修计划
                  return HomePlan(2);
                  break;
                case "project": //项目
                  return Container(
                    height: 0,
                  );
                  break;
                case "video":
                  return HomeSpecialColumn();
                  break;
                default:
                  return Container(
                    height: 0,
                  );
                  break;
              }
            },
            controller: _controller,
          ),
          onRefresh: _handleRefresh,
        ),
        Positioned(
          bottom: 50,
          right: 50,
          child: MaterialButton(
            color: Color(0xff005587),
            onPressed: ()=>context.read<MessageCounter>().setCount(2),
            child: Text(
              "点击一下",
            style: TextStyle(
              color: Colors.white
            ),
            ),
          ),
        ),
      ],
    );
  }

}