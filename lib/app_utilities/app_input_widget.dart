import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/size_config.dart';

import 'style.dart';

class AppTextField extends StatelessWidget{

  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final int minLines, maxLines;
  final bool isPasswordType, isEnabled, showDropIcon, showPhonePrefix, showAsDisabled;
  final TextEditingController controller;
  final String prefixText;
  final Widget dropDownIcon;

  const AppTextField({Key key,
    this.textCapitalization,
    this.inputType,
    this.isPasswordType,
    this.controller,
    this.isEnabled,
    this.minLines = 1,
    this.maxLines = 1,
    this.showDropIcon,
    this.showAsDisabled,
    this.prefixText,
    this.dropDownIcon,
    this.showPhonePrefix
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: showAsDisabled != null && showAsDisabled ? colorGray_300 : colorWhite,
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.inputBorderRadius)),
            border: Border.all(
                color: showAsDisabled != null && showAsDisabled ? colorGray_300 : colorWhite,
                width: 0
            )
        ),
        child: TextField(
          style: TextStyleBuilder.regularSmall(),
          controller: controller,
          cursorColor: theme_primary_color,          
          textCapitalization: textCapitalization != null ? textCapitalization : TextCapitalization.none,
          keyboardType: inputType != null ? inputType : TextInputType.text,
          obscureText: isPasswordType != null ? isPasswordType : false,
          enabled: isEnabled != null ? isEnabled : true,
          textAlignVertical: TextAlignVertical.center,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: (showPhonePrefix != null && showPhonePrefix) ? _getPhoneNumberPrefix() : null,
            prefix: prefixText != null ? Text(prefixText, style: TextStyleBuilder.regularSmall()) : null,
            suffixIcon: (showDropIcon!= null && showDropIcon) ? dropDownIcon != null ? dropDownIcon : Image.asset('assets/ic_dropdown.png') : null,
            contentPadding: (showPhonePrefix != null && showPhonePrefix) ? EdgeInsets.only(top: SizeConfig.dimen_10sdp, bottom: SizeConfig.dimen_10sdp,) : EdgeInsets.all(SizeConfig.dimen_10sdp),
          ),
        )
    );
  }

  Widget _getPhoneNumberPrefix(){
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.dimen_10sdp, bottom: SizeConfig.dimen_10sdp, right: SizeConfig.dimen_15sdp, left: SizeConfig.dimen_15sdp),
      decoration: BoxDecoration(
        color: colorGray_300,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConfig.inputBorderRadius), bottomLeft: Radius.circular(SizeConfig.inputBorderRadius)),
      ),
      child: Text('+91', style: TextStyleBuilder.regularSmall(), textAlign: TextAlign.center,),
    );
  }
}

class AppTextField2 extends StatelessWidget{

  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final bool isPasswordType, isEnabled;
  final TextEditingController controller;
  final String hintText, prefixImagePath;

  const AppTextField2({Key key,
    this.textCapitalization,
    @required this.hintText,
    @required this.prefixImagePath,
    this.inputType,
    this.isPasswordType,
    this.controller,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.inputBorderRadius)),
            border: Border.all(
                color: colorWhite,
                width: SizeConfig.strokeWidth
            )
        ),
        child: TextField(
          style: TextStyleBuilder.regularSmall(),
          controller: controller,
          cursorColor: theme_text_fill_color,
          textCapitalization: textCapitalization != null ? textCapitalization : TextCapitalization.none,
          keyboardType: inputType != null ? inputType : TextInputType.text,
          obscureText: isPasswordType != null ? isPasswordType : false,
          enabled: isEnabled != null ? isEnabled : true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixIcon: Image.asset(prefixImagePath),
            contentPadding: EdgeInsets.all(SizeConfig.dimen_13sdp),
            hintStyle: TextStyleBuilder.regularSmall(
                textColor: theme_text_hint_color
            ),
          ),
        )
    );
  }
}

class AppButton extends RaisedButton{

  final String title;
  final ShapeBorder buttonShape;
  final Color buttonColor, buttonTextColor;
  final VoidCallback onPressed;
  AppButton({@required this.title, this.buttonShape, this.buttonColor, @required this.onPressed, this.buttonTextColor});

  @override
  ShapeBorder get shape {
    return buttonShape != null ? buttonShape : RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.inputBorderRadius)),
    );
  }

  @override
  Widget get child => Container(
    padding: EdgeInsets.all(SizeConfig.dimen_10sdp),
    child: Text(title, style: TextStyleBuilder.mediumSmall(textColor: buttonTextColor != null ? buttonTextColor : theme_text_fill_color),),
  );

  @override
  Color get color {
   return buttonColor != null ? buttonColor : theme_primary_color;
  }
}