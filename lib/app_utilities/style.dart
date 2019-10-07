import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/size_config.dart';

//colors
const Color theme_text_fill_color = Colors.black;
const Color theme_primary_color = Color(0xFFF2D522);
const Color colorGray_300 = Color(0xFFE0E0E0);
const Color colorGray_500 = Color(0xFF9E9E9E);
const Color colorWhite = Colors.white;
const Color theme_text_hint_color = Color(0xFFA3A3A3);
const Color colorGray_200 = Color(0xFFEEEEEE);
const Color colorGray_400 = Color(0xFFBDBDBD);
const Color colorGray_50 = Color(0xFFFAFAFA);

class TextStyleBuilder {
  static TextStyle regular({Color textColor, @required double textSize, bool underLineText}){
    return TextStyle(
      fontFamily: 'Ubuntu',
      color: textColor != null ? textColor : theme_text_fill_color,
      fontWeight: FontWeight.w400,
      decoration: (underLineText != null && underLineText == true) ? TextDecoration.underline : TextDecoration.none,
      fontSize: textSize
    );
  }

  static TextStyle regularVSmall({Color textColor, bool underLineText}){
    return TextStyleBuilder.regular(textSize: SizeConfig.textSizeVerySmall, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle regularSmall({Color textColor, bool underLineText}){
    return TextStyleBuilder.regular(textSize: SizeConfig.textSizeSmall, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle regularMedium({Color textColor, bool underLineText}){
    return TextStyleBuilder.regular(textSize: SizeConfig.textSizeMedium, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle regularLarge({Color textColor, bool underLineText}){
    return TextStyleBuilder.regular(textSize: SizeConfig.textSizeLarge, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle regularXLarge({Color textColor, bool underLineText}){
    return TextStyleBuilder.regular(textSize: SizeConfig.textSizeXLarge, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle regularHeading({Color textColor, bool underLineText}){
    return TextStyleBuilder.regular(textSize: SizeConfig.textSizeHeading, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle medium({Color textColor, @required double textSize, bool underLineText}){
    return TextStyle(
      fontFamily: 'Ubuntu',
      color: textColor != null ? textColor : theme_text_fill_color,
      fontWeight: FontWeight.w500,
      decoration: (underLineText != null && underLineText == true) ? TextDecoration.underline : TextDecoration.none,
      fontSize: textSize
    );
  }

  static TextStyle mediumVSmall({Color textColor, bool underLineText}){
    return TextStyleBuilder.medium(textSize: SizeConfig.textSizeVerySmall, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle mediumSmall({Color textColor, bool underLineText}){
    return TextStyleBuilder.medium(textSize: SizeConfig.textSizeSmall, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle mediumMedium({Color textColor, bool underLineText}){
    return TextStyleBuilder.medium(textSize: SizeConfig.textSizeMedium, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle mediumLarge({Color textColor, bool underLineText}){
    return TextStyleBuilder.medium(textSize: SizeConfig.textSizeLarge, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle mediumXLarge({Color textColor, bool underLineText}){
    return TextStyleBuilder.medium(textSize: SizeConfig.textSizeXLarge, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle mediumHeading({Color textColor, bool underLineText}){
    return TextStyleBuilder.medium(textSize: SizeConfig.textSizeHeading, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle bold({Color textColor, @required double textSize, bool underLineText}){
    return TextStyle(
      fontFamily: 'Ubuntu',
      color: textColor != null ? textColor : theme_text_fill_color,
      fontWeight: FontWeight.w700,
      decoration: (underLineText != null && underLineText == true) ? TextDecoration.underline : TextDecoration.none,
      fontSize: textSize
    );
  }

  static TextStyle boldVSmall({Color textColor, bool underLineText}){
    return TextStyleBuilder.bold(textSize: SizeConfig.textSizeVerySmall, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle boldSmall({Color textColor, bool underLineText}){
    return TextStyleBuilder.bold(textSize: SizeConfig.textSizeSmall, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle boldMedium({Color textColor, bool underLineText}){
    return TextStyleBuilder.bold(textSize: SizeConfig.textSizeMedium, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle boldLarge({Color textColor, bool underLineText}){
    return TextStyleBuilder.bold(textSize: SizeConfig.textSizeLarge, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle boldXLarge({Color textColor, bool underLineText}){
    return TextStyleBuilder.bold(textSize: SizeConfig.textSizeXLarge, textColor: textColor, underLineText: underLineText);
  }

  static TextStyle boldHeading({Color textColor, bool underLineText}){
    return TextStyleBuilder.bold(textSize: SizeConfig.textSizeHeading, textColor: textColor, underLineText: underLineText);
  }
}