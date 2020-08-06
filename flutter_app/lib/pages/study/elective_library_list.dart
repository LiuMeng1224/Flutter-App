import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class ElectiveLibraryList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ElectiveLibraryListState();
  }

}

class ElectiveLibraryListState extends State<ElectiveLibraryList>{
  EasyRefreshController _easyRefreshController = EasyRefreshController();

  int _count = 3;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      controller: _easyRefreshController,
      onRefresh: () async{
        if (mounted) {
          setState(() {
            _count = 20;
          });
        }
      },
      onLoad: () async{
        if (mounted) {
          setState(() {
            _count += 20;
          });
        }
      },
      slivers:[
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return ListTile(
                title: Text("这是第$index个item"),
                subtitle: Text("这是内容呀"),
              );
            },
            childCount: _count,
          ),
        ),
      ]
    );
  }

}