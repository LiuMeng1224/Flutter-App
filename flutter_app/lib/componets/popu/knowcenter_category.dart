import 'package:ECEIBS/common/common_color.dart';
import 'package:ECEIBS/router/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KnowledgeCenterCategory extends StatefulWidget{

  double height = 0.0;
  KnowledgeCenterCategory(this.height);

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeCenterCategoryState(height);
  }
}

class _KnowledgeCenterCategoryState extends State<KnowledgeCenterCategory> with TickerProviderStateMixin{
  int _parentIndex = 0;
  int _childIndex = 0;

  double height = 0.0;
  _KnowledgeCenterCategoryState(this.height);

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigatorUtils.goBack(context);
      },
      child: Container(
        alignment: Alignment.topLeft,
        color: Colors.black38,
        height: height,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
          ),
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _getLeftItem(0),
                    _getLeftItem(1),
                    _getLeftItem(2),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _getRightItem(0),
                    _getRightItem(1),
                    _getRightItem(2),
                    _getRightItem(3),
                    _getRightItem(4),
                    _getRightItem(5),
                    _getRightItem(6),
                    _getRightItem(7),
                    _getRightItem(8),
                    _getRightItem(9),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLeftItem(int index) {
    return InkWell(
      onTap: () {
        _parentIndex = index;
        _childIndex = 0;
        setState(() {

        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Offstage(
            offstage: _parentIndex != index,
            child: SizedBox(
              width: 3,
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(color: CommonColor.themeColor),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 50,
              color: _parentIndex == index ? CommonColor.dividerLineF7: Colors.white,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "分类$index",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: _parentIndex == index
                        ? CommonColor.themeColor
                        : CommonColor.textNormalColor
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getRightItem(int index) {
    return InkWell(
      onTap: () {
        _childIndex = index;
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          "子分类$index",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              color: _childIndex == index
                  ? CommonColor.themeColor
                  : CommonColor.textNormalColor),
        ),
      ),
    );
  }

}

