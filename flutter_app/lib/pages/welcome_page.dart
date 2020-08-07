import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ECEIBS/router/application.dart';
import 'package:ECEIBS/router/routers.dart';
import 'package:flutter_screenutil/screenutil.dart';
//启动页
class WelcomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage>{
  bool _isFirst = true;//是否第一次进入APP
  bool _isLogin = false; //是否登录

  //获取是否第一次进入APP和登录状态
  _getLoginState() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isFirst = preferences.getBool("isFirst") ?? true;
    if(_isFirst){
      preferences.setBool("isFirst", false);
    }else{
      String token = preferences.getString("token") ?? "";
      _isLogin = !(token == null || token.isEmpty);
    }
    //2秒后跳转 flutter中可以通过Future.delay或者Timer来达到延时执行的目的
    Future.delayed(const Duration(milliseconds: 2000),(){
      if(_isFirst){
        Application.router.navigateTo(context, Routers.guidePage,clearStack: true);
      }else{
        if(_isLogin){
          Application.router.navigateTo(context, Routers.home,clearStack: true);
        }else{
          Application.router.navigateTo(context, Routers.login,clearStack: true);
        }
      }
    });

    //    Timer(Duration(seconds: 2), () {
    //
    //    });
  }

  //跳转到下个页面
  _openNextPage(int type){
    switch(type){
      case 1:  //第一次打开APP跳转到引导页
        Navigator.popAndPushNamed(context, "GuidePageRoute");
        break;
      case 2: //已登录跳转到主页面
        Navigator.popAndPushNamed(context, "MainPageRoute");
        break;
      case 3: // 未登录跳转到登录页面
        Navigator.popAndPushNamed(context, "LoginPageRoute");
        break;
      default:
        Navigator.popAndPushNamed(context, "GuidePageRoute");
    }
    /*1、静态注册跳转 Using named navigator routes
    1.1 pushNamed 方法单纯跳转页面
    Navigator.pushNamed(context, "GuidePageRoute");
    1.2  pushNamedAndRemoveUntil 跳转页面并销毁当前页面
    包含三个参数，第一个为上下文环境，第二个参数为静态注册的对应的页面名称，第三个参数为跳转后的操作，route == null 为销毁当前页面
    Navigator.pushNamedAndRemoveUntil(context, "GuidePageRoute", (route) => route == null);
    */

    /*
    2、动态注册跳转
    2.1 跳转页面
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      switch(type){
        case 1:
          return GuidePage();
          break;
        case 2:
          return MainPage();
          break;
        case 3:
          return LoginPage();
          break;
        default:
          return GuidePage();
      }

    }));
    2.2 跳转页面并传递参数
    Navigator.push<String>(
    context,
    new MaterialPageRoute(
      builder: (BuildContext context) {
        return new GuidePage(msg: "123456");
      },
    ),
  );
    */

    /*
    3、销毁页面
    3.1 销毁当前页面
        Navigator.pop(context);
        销毁页面并传值
        Navigator.pop(context, '这是 GuidePage 页');
        上一个页面接受数据使用关键词then
        Navigator.push<Object>(context, MaterialPageRoute(builder: (context) => GuidePage()))
                .then((Object result){
                  result就是传递过来的数据
            });
     3.2 销毁当前页面并跳转指向新的页面  第一个参数为上下文环境，第二个参数为静态注册的跳转页面名称
     Navigator.popAndPushNamed(context, 'GuidePageRoute');
     */
  }

  @override
  void initState() {
    super.initState();
    _getLoginState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(child: Image.asset("assets/images/splash_img.webp",fit: BoxFit.cover,),);
  }

}