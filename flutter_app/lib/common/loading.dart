
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setWidth(100),
      child: CircularProgressIndicator(
        strokeWidth: ScreenUtil().setWidth(10),
        valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
      ),
    );
  }

}