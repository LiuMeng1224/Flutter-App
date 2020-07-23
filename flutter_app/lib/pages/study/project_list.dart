import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class ProjectList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProjectListState();
  }

}

class ProjectListState extends State<ProjectList>{
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