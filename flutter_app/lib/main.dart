import 'package:ECEIBS/provider/message_counter.dart';
import 'package:ECEIBS/router/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ECEIBS/pages/welcome_page.dart';
import 'package:ECEIBS/router/routers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>MessageCounter(),),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Router router = Router();
    Routers.configureRouters(router);
    Application.router = router;
    SystemChrome.setEnabledSystemUIOverlays([]);
    
    //flutter可以隐藏状态栏或使得状态栏透明，同时也支持底部按钮栏的隐藏
//    SystemChrome.setEnabledSystemUIOverlays([]);//隐藏状态栏，底部按钮栏
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);//隐藏状态栏，保留底部按钮栏
//    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);//显示状态栏、底部按钮栏
//
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle( //设置状态栏透明
//      statusBarColor: Colors.transparent,
//    ));

    return MaterialApp(
      title: 'ECEIBS',
      theme: ThemeData(
        primaryColor: Color(0xff005587),
        backgroundColor: Color(0xfff6f6f6),
      ),
      home: Scaffold(body: WelcomePage()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
    );
  }
}


