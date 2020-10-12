import 'package:ECEIBS/common/common_color.dart';
import 'package:ECEIBS/componets/popu/category_popupwindow.dart';
import 'package:ECEIBS/componets/popu/knowcenter_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screenutil.dart';

class KnowledgeCenter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return KnowledgeCenterState();
  }
}

class KnowledgeCenterState extends State<KnowledgeCenter>{

  List<String> _titles = ["类型","分类","排序"];
  int _currentIndex = -1;
  EasyRefreshController _refreshController;
  ScrollController _scrollController;
  int _dataCount = 4;
  List<String> _types = ["type","category","sort"];
  final GlobalKey _boyKey = GlobalKey();
  final GlobalKey _filterKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
    _scrollController = ScrollController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "知识汇",
          style: TextStyle(
              color: CommonColor.textNormalColor,
              fontSize: 17
          ),
        ),
      ),
      body: Column(
        key: _boyKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: CommonColor.dividerLineF7,
              ),
            ),
          ),
          Container(
            key: _filterKey,
            width: MediaQuery.of(context).size.width,
            height: 45,
            color: Colors.white,
            alignment: Alignment.center,
            child: Row(
              children: _getTabList(MediaQuery.of(context).size.width/_titles.length),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: CommonColor.dividerLineF7,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                EasyRefresh.custom(
                    header: ClassicalHeader(),
                    footer:ClassicalFooter(),
                    controller: _refreshController,
                    scrollController: _scrollController,
                    onRefresh: _refreshData,
                    onLoad: _reloadData,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                                (context,index){
                              return _getListItem();
                            },
                            childCount: _dataCount
                        ),
                      )
                    ]
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshData() async{

    await Future.delayed(Duration(seconds: 2),(){
      _refreshController.resetLoadState();
      _refreshController.finishRefresh();
      if(mounted){
        _dataCount = 10;
        setState(() {

        });
      }
    });
  }

  Future<void> _reloadData() async{
    await Future.delayed(Duration(seconds: 2),(){

      if(mounted){
        _dataCount += 10;
        _refreshController.finishLoad(noMore: _dataCount>30);
        setState(() {

        });
      }
    });
  }

  List<Widget> _getTabList(double width){

    List<Widget> widgetList = [];
    _titles.forEach((element) {
      widgetList.add(_getTabItem(element,width));
    });
    return widgetList;
  }


  Widget _getTabItem(String label,double width){
    return InkWell(
      onTap: (){
        _currentIndex = _titles.indexOf(label);
        _showSortMenu();
        setState(() {
        });
      },
      child: Container(
        width: width,
        height: 50,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _currentIndex==_titles.indexOf(label)?CommonColor.themeColor:CommonColor.textNormalColor,
                fontSize: 14,
              ),
            ),
            Icon(IconData(_currentIndex==_titles.indexOf(label)?0xe62b:0xe62a,fontFamily: 'iconfont'),size: 8,color: CommonColor.grey9,),
          ],
        ),
      ),
    );
  }

  Widget _getListItem(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left:15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15,),
          _getResourceName(),
          SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/icon_default_head.png",width:25,height: 25,fit: BoxFit.cover,),
              SizedBox(width: ScreenUtil().setWidth(17),),
              Text("Mary",style: TextStyle(fontSize: 12,color: CommonColor.grey6),)
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(14),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "360浏览 · 12评论",
                style: TextStyle(fontSize: 12,color: CommonColor.grey9),
              ),
              Text(
                "2020.08.08",
                style: TextStyle(fontSize: 12,color: CommonColor.grey9),
              ),
            ],
          ),
          SizedBox(height: 15,),
          SizedBox(
            width: ScreenUtil.screenWidth,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: CommonColor.dividerLineF7
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getResourceName(){
    return Text.rich( //图文混排
      TextSpan(
          children: [
            WidgetSpan(
                child: Container(
                  alignment: Alignment.center,
                  width: 20*2.0,
                  height: 18,
                  padding: EdgeInsets.only(left: 3,right:3),
                  decoration: BoxDecoration(
                    border: Border.all(color: CommonColor.themeColor,width: ScreenUtil().setWidth(2)),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Text(
                    "文章",
                    style: TextStyle(
                        color: CommonColor.themeColor,
                        fontSize: 11
                    ),
                  ),
                )
            ),
            TextSpan(
                text: " 项目管理",
                style: TextStyle(
                  color: CommonColor.textNormalColor,
                  fontSize: 14,
                  fontWeight:FontWeight.w500,
                )
            ),
          ]
      ),
      textAlign:TextAlign.start,
      maxLines:2,
      overflow: TextOverflow.ellipsis,
    );
  }

  void _showSortMenu() {
    // 获取点击控件的坐标
    final RenderBox button = _filterKey.currentContext.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    // 获得控件左下方的坐标
    final Offset a =  button.localToGlobal(Offset(0.0, button.size.height), ancestor: overlay);
    // 获得控件右下方的坐标
    final Offset b =  button.localToGlobal(button.size.bottomLeft(const Offset(0, 12.0)), ancestor: overlay);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(a, b),
      Offset.zero & overlay.size,
    );
    final RenderBox body = _boyKey.currentContext.findRenderObject() as RenderBox;
    showPopupWindow<void>(
      context: context,
      fullWidth: true,
      position: position,
      elevation: 0.0,
      child: KnowledgeCenterCategory(body.size.height-button.size.height),
    );

  }


}




