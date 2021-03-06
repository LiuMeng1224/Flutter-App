import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ECEIBS/componets/home/home_swiper.dart';
import 'package:ECEIBS/componets/home/image_text_navigator.dart';
import 'package:ECEIBS/componets/home/learn_activity_paln.dart';
import 'package:ECEIBS/provider/message_counter.dart';
import 'package:provider/provider.dart';
import 'package:ECEIBS/componets/HomePlan.dart';

//首页
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{
  List<String> _moduleList = ["banner","navigator","elective plan","compulsory plan","swper_test","project"];
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
                  return HomeSwiper();
                  break;
                case "navigator": //导航
                  return ImageTextNavigator();
                  break;
                case "elective plan": //选修计划
                  return LearnActivityPlan();
                  break;
                case "project": //项目
                  return HomePlan(1);
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
      ],
    );
  }

}