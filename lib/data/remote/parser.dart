import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_architecture/data/model/api_response/BaseResponse.dart';
import 'package:http/http.dart' as http;

const int NO_INTERNET = 404;
const int SUCCESS = 200;
const HTTP_SOME_OTHER_ERROR = 'Some error occured, please try again.';

/// A class similar to http.Response but instead of a String describing the body
/// it already contains the parsed Dart-Object
class ParsedResponse<T> {
  ParsedResponse(this.statusCode, this.body);
  final int statusCode;
  final T body;

  bool isOk() => statusCode == 200;
}

void parseResponse<Q, R>(http.Response response, ComputeCallback<String, R> callback, NetworkResponseCallBack<Q> networkResponseCallBack) async {
  if(response == null) {
    networkResponseCallBack.onServerErrorCallBack(HTTP_SOME_OTHER_ERROR);
  }

  try{
    if(response.statusCode == 200){
      //success
      var result = await compute(callback, response.body);
      networkResponseCallBack.onSuccessCallBack(result as Q);
    }else{
      var errorObj = json.decode(response.body)['error'];
      var errorMsg = errorObj['message'];
      networkResponseCallBack.onServerErrorCallBack(errorMsg);
    }
  }catch(e){
    networkResponseCallBack.onServerErrorCallBack(HTTP_SOME_OTHER_ERROR);
  }
}

Future<BaseResponse> parseBaseResponse(String responseBody) async {
  BaseResponse baseResponse = BaseResponse();
  var dataObj = json.decode(responseBody)['data'];
  baseResponse.message = dataObj['message'];
  baseResponse.success = dataObj['success'];
  return baseResponse;
}

class NetworkResponseCallBack<T>{
  final OnSuccessCallBack<T> onSuccessCallBack;
  final OnServerErrorCallBack onServerErrorCallBack;
  NetworkResponseCallBack({this.onSuccessCallBack, this.onServerErrorCallBack});
}

typedef OnSuccessCallBack<T> = void Function(T);
typedef OnServerErrorCallBack = void Function(String errorMsg);