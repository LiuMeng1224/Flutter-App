import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class KnowledgeCenterCategory extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeCenterCategoryState();
  }
}

class _KnowledgeCenterCategoryState extends State<KnowledgeCenterCategory> with TickerProviderStateMixin{
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 5000),vsync: this);
    _animation = Tween(begin: Offset.zero,end: Offset(0,1.0)).animate(_animationController);
    _animation.addListener(() {
      setState(() {

      });
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      alignment: Alignment.topLeft,
      color: Colors.black26,
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
          ),
          child: Text("分类"),
        ),
      ),
    );
  }
}