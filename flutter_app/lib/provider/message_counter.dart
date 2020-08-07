
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MessageCounter with ChangeNotifier,DiagnosticableMixin{

  int _unreadMessageCount = 0; //未读消息数量

  int get unreadMessageCount => _unreadMessageCount;

  void setCount(int count){
    this._unreadMessageCount = count;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('unreadMessageCount',unreadMessageCount));
  }

}