import 'package:ECEIBS/http/api.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceUtil{
  static setBarStatus(bool isDarkIcon, {Color color: Colors.transparent}) async{
    if (Platform.isAndroid) {
      if (isDarkIcon) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.dark);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      } else {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
            statusBarColor: color, statusBarIconBrightness: Brightness.light);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    }
  }

  //获取接口公共参数
  static Future getCommonPar() async{
    //sys_id=0&brand=HUAWEI&rom=HUAWEI&client_version=1.8.9&os_version=8.0.0&sso_token=6ca93166fc1a7e4625a60c4c2255be8b&user_id=10547&company_id=145&language=zh-CN
    String systemId = "";
    String brand = "";
    String rom = "";
    String version = "";
    String token = "";
    String userId = "";
    String companyId = "";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      systemId = "0";
      brand = androidInfo.brand;
      rom = androidInfo.manufacturer;
    }else{
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      systemId = "1";
      brand = iosDeviceInfo.utsname.machine;
      rom = "";
    }
    version = packageInfo.version;
    token = prefs.getString(API.token);
    userId = prefs.getString(API.user_id);
    companyId = prefs.getString(API.company_id);
    API.COMMONPARAMS = "sys_id="+systemId+"&brand="+brand+"&rom="+rom+"&client_version="+version+"&sso_token="+token+"&user_id="+userId+"&company_id="+companyId+"&language=zh-CN";
  }

}