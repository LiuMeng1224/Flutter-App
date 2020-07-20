import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:ECEIBS/pages/main_page.dart';
import 'package:ECEIBS/pages/login_page.dart';
import 'package:ECEIBS/pages/GuidePage.dart';
//通过Handler定制路由规则,重写handlerFunc方法，Map类型的参数params接收页面跳转传递的参数
//主页面跳转
var homeHandler = Handler(
  handlerFunc:(BuildContext context,Map<String,List<String>> params){
    return MainPage();
  }
);

//登录页面跳转
var loginHandler = Handler(
    handlerFunc:(BuildContext context,Map<String,List<String>> params){
      return LoginPage();
    }
);

//引导页跳转
var guidePageHandler = Handler(
    handlerFunc: (BuildContext context,Map<String,List<String>> params){
      return GuidePage();
    }
);