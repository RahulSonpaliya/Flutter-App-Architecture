import 'package:flutter/widgets.dart';

//This class is used to provide dimensions (eg. margins, padding, width & height) to our app, which are sized as
//per different screen resolutions
class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth, screenWidthActual;
  static double screenHeight, screenHeightActual;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double textSizeVerySmall, textSizeSmall, textSizeMedium, textSizeLarge, textSizeHeading, textSizeXLarge;
  static double dimen_20sdp, dimen_10sdp, dimen_5sdp, dimen_2sdp,
      dimen_35sdp, dimen_15sdp, dimen_29sdp, dimen_40sdp, devicePixelRatio,
      dimen_70sdp, separatorWidth, strokeWidth, inputBorderRadius, dimen_85sdp, dimen_50sdp,
      dimen_65sdp, dimen_28sdp, dimen_4sdp, dimen_24sdp, dimen_13sdp, dimen_100sdp;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    screenHeightActual = screenHeight - _safeAreaVertical;
    screenWidthActual = screenWidth - _safeAreaHorizontal;

    textSizeVerySmall = safeBlockHorizontal * 3.25; //for 12 pixel text-size
    textSizeSmall = safeBlockHorizontal * 4; //for 14 pixel text-size
    textSizeMedium = safeBlockHorizontal * 4.5; //for 16 pixel text-size
    textSizeLarge = safeBlockHorizontal * 5; //for 18 pixel text-size
    textSizeXLarge = safeBlockHorizontal * 6; //for 20 pixel text-size
    textSizeHeading = safeBlockHorizontal * 6.5; //for 24 pixel text-size

    separatorWidth = safeBlockHorizontal * 0.25; //approx 1 pixel
    strokeWidth = safeBlockHorizontal * 0.5; //approx 1.5 pixel
    inputBorderRadius = safeBlockHorizontal * 1.5; //approx 5 pixel
    dimen_4sdp = safeBlockHorizontal * 1; //approx 5 pixel
    dimen_5sdp = safeBlockHorizontal * 1.5; //approx 5 pixel
    dimen_10sdp = safeBlockHorizontal * 3; //approx 10 pixel
    dimen_13sdp = safeBlockHorizontal * 3.5; //approx 13 pixel
    dimen_15sdp = safeBlockHorizontal * 4; //approx 15 pixel
    dimen_20sdp = safeBlockHorizontal * 6; //approx 20 pixel
    dimen_24sdp = safeBlockHorizontal * 6.5; //approx 24 pixel
    dimen_29sdp = safeBlockHorizontal * 8; //approx 29 pixel
    dimen_35sdp = safeBlockHorizontal * 10; //approx 35 pixel
    dimen_40sdp = safeBlockHorizontal * 11; //approx 40 pixel
    dimen_70sdp = safeBlockHorizontal * 19.5; //approx 70 pixel
    dimen_85sdp = safeBlockHorizontal * 23.5; //approx 85 pixel
    dimen_50sdp = safeBlockHorizontal * 14; //approx 50 pixel
    dimen_65sdp = safeBlockHorizontal * 18; //approx 65 pixel
    dimen_28sdp = safeBlockHorizontal * 8; //approx 28 pixel
    dimen_2sdp = safeBlockHorizontal * 0.5; //approx 2 pixel
    dimen_100sdp = dimen_50sdp + dimen_50sdp;
  }

  static double get(double val) => safeBlockHorizontal * val;
}