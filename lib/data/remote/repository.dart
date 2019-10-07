import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_architecture/data/model/api_response/BaseResponse.dart';
import 'package:flutter_app_architecture/data/remote/parser.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const String BASE_URL = "http://base_url.com/";
const String SIGN_UP_URL = BASE_URL+"api/register";
const String SIGN_IN_URL = BASE_URL+"api/login";
const String VERIFY_OTP = BASE_URL+"api/verify-otp";
const String SEND_OTP = BASE_URL+"api/send-otp";
const String FORGOT_PASSWORD = BASE_URL+"api/forgot-password/";
const String RESET_PASSWORD = BASE_URL+"api/reset-password";
const String CHECK_SOCIAL_DETAIL = BASE_URL+"api/check-social-detail";
const String SOCIAL_SIGNUP = BASE_URL+"api/social-signup";

const Map<String, String> HEADER = const{
  'Accept': 'application/json'
};

abstract class Repository{
  static final Repository _repo = new Network();
  static Repository get() => _repo;

  Future<ParsedResponse<String>> getFCMToken() async {
    return new ParsedResponse(NO_INTERNET, null);
    // return FirebaseMessaging().getToken().then((token){
    //   return new ParsedResponse(SUCCESS, token);
    // }).catchError((error){
    //   return new ParsedResponse(NO_INTERNET, null);
    // });
  }

  Future<Map<String, dynamic>> getFBUserDetails(String accessToken) async {
    http.Response response = await callGetAPI('https://graph.facebook.com/v2.12/me?fields=id,name,first_name,last_name,email&access_token=$accessToken');
    if(response == null){
      return null;
    }else{
      Map<String, dynamic> fbUser = Map();
      fbUser['id'] = json.decode(response.body)['id'];
      fbUser['email'] = json.decode(response.body)['email'];
      fbUser['name'] = json.decode(response.body)['name'];
      return fbUser;
    }
  }

  Future<void> signIn(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});

  Future<void> signUp(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});

  Future<void> sendOTP(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});

  Future<void> verifyOTP(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});

  Future<void> resetPassword(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});

  Future<void> forgotPassword(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, String email);

  Future<void> checkSocialDetail(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});

  Future<void> socialSignUp(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody});
}

class Network extends Repository{
  @override
  Future<void> signIn(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(SIGN_IN_URL, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> signUp(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {@required Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(SIGN_UP_URL, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> sendOTP(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(SEND_OTP, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> verifyOTP(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(VERIFY_OTP, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> forgotPassword(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, String email) async {
    http.Response response = await callGetAPI("$FORGOT_PASSWORD$email", headers: HEADER);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> resetPassword(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(RESET_PASSWORD, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> checkSocialDetail(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(CHECK_SOCIAL_DETAIL, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }

  @override
  Future<void> socialSignUp(NetworkResponseCallBack<BaseResponse> networkResponseCallBack, {Map<String, String> requestBody}) async {
    http.Response response = await callPostAPI(SOCIAL_SIGNUP, HEADER, body: requestBody);
    parseResponse(response, parseBaseResponse, networkResponseCallBack);
  }
}

Future<http.Response> callPostAPI(String apiURL, Map<String, String> headers, {Map<String, String> body}) async {
  if(body != null){
    return await http.post(apiURL, headers: headers, body: body).catchError((error){
      return null;
    }).timeout(Duration(seconds: 60), onTimeout: (){
      return null;
    });
  }else{
    return await http.post(apiURL, headers: headers).catchError((error){
      return null;
    }).timeout(Duration(seconds: 60), onTimeout: (){
      return null;
    });
  }
}

Future<http.Response> callGetAPI(String apiURL, {Map<String, String> headers}) async {
  if(headers != null){
    return await http.get(apiURL, headers: headers).catchError((error){
      return null;
    }).timeout(Duration(seconds: 60), onTimeout: (){
      return null;
    });
  }else{
    return await http.get(apiURL).catchError((error){
      return null;
    }).timeout(Duration(seconds: 60), onTimeout: (){
      return null;
    });
  }
}