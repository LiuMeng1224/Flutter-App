
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "未找到"
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "找不到页面，请检查跳转路由"
        ),
      ),
    );
  }
}