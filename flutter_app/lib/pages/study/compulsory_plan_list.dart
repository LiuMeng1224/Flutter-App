import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class CompulsoryPlanList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CompulsoryPlanListState();
  }

}

class CompulsoryPlanListState extends State<CompulsoryPlanList>{
  EasyRefreshController _easyRefreshController = EasyRefreshController();


  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      controller: _easyRefreshController,

    );
  }

}