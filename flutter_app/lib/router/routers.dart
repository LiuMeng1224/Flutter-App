
import 'package:ECEIBS/pages/no_found.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'router_handler.dart';

//设置不同页面的路由，根路由和找不到路由时的跳转
class Routers{
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String notFound = "/404";
  static String guidePage = "/guidePage";

  static void configureRouters(Router router){

    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        return NotFound();
      }
    );
    router.define(home, handler: homeHandler);
    router.define(login, handler: loginHandler);
    router.define(guidePage, handler: guidePageHandler);
  }
}