import 'dart:convert';

import 'package:http/http.dart';

import '../model/net_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    "Content-Type": 'application/json;charset=UTF-8'
  };

  /* Http Api*/
  static String API_LIST = "api/v1/employees";
  static String API_LIST1 = "api/v1/employee/";
  static String API_CREATE ="api/v1/create";
  static String API_UPDATE ="api/v1/update/";
  static String API_DELETE ="api/v1/delete/2";


  /* Http request*/
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api );
    var response = await post(uri, headers: headers,body:jsonEncode(params));
    if (response.statusCode == 200||response.statusCode == 201) {
      return response.body;
    }
    return null;
  }


  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api );
    var response = await put(uri, headers: headers,body:jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  static Map<String,String> paramsEmpty(){
    Map<String,String>params=new Map();
    return params;
  }
  static Map<String,String> paramsCreat(Post post){
    Map<String,String> params=new Map();
    params.addAll({
      'title':post.title,
      'body':post.body,
      'userID':post.userID.toString(),
    });
    return params;
  }
  static Map<String,String> paramsUpdate(Post post){
    Map<String,String> params=new Map();
    params.addAll({
      'id':post.id.toString(),
      'title':post.title,
      'body':post.body,
      'userID':post.userID.toString(),
    });
    return params;
  }
}
