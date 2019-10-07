import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'slide_left_route.dart';

void startScreenAndKillAll(BuildContext context, {Widget screen, Route newRoute}){
  if(newRoute == null){
    Navigator.pushAndRemoveUntil(context, SlideLeftRoute(widget: screen), (Route<dynamic> route) => false);
  }else{
    Navigator.pushAndRemoveUntil(context, newRoute, (Route<dynamic> route) => false);
  }
}

void startScreen(BuildContext context, Widget screen){
  Navigator.push(context, SlideLeftRoute(widget: screen));
}

void closeScreen(BuildContext context){
  Navigator.pop(context);
}

class NoSlide extends MaterialPageRoute{
  final Widget widget;
  NoSlide({@required this.widget}) : super(
    builder: (BuildContext context){
      return widget;
    }
  );
}

Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

Widget noActionBar(){
  return PreferredSize(
    preferredSize: Size(0, 0),
    child: AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.light,
      elevation: 0,
    ),
  );
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
}