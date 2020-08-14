import 'package:ECEIBS/http/api.dart';
import 'package:ECEIBS/utils/DeviceUtil.dart';
import 'package:dio/dio.dart';

// get请求 url：请求连接 params：请求参数
Future getRequest(String url,Map<String,dynamic> params) async{

  try{
    Response response = await Dio().get(url,queryParameters: params);
    return response.data;
  }catch(e){
    return e.toString();
  }
}

// post请求 url：请求连接 params：请求参数
Future postRequest(url,{Map<String,String> formData})async{
  if(API.COMMONPARAMS.isEmpty){
    var commonParams = await DeviceUtil.getCommonPar();
  }
  print("postRequest:url--"+url+"?"+API.COMMONPARAMS);
  try{
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    if(formData == null){
      response = await dio.post(url+"?"+API.COMMONPARAMS);
    }else{
      response = await dio.post(url+"?"+API.COMMONPARAMS,data:formData);
    }
    print("result==${response.data}");
    if(response.statusCode==200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }

}
