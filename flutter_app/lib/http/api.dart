//接口连接
import 'package:ECEIBS/utils/DeviceUtil.dart';

class API  {

  static const String BASE_URL = "https://a1.test.eceibs.com.cn/";
  static String COMMONPARAMS = ""; //公共参数
  static const String token = "token";
  static const String user_id = "user_id";
  static const String company_id = "company_id";
  static const String HOME_MODULES = BASE_URL + "index.php/mobile/index/modules"; //首页导航接口
}