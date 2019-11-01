import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/size_config.dart';
import 'package:flutter_app_architecture/app_utilities/style.dart';

void showLoadingIndicator(BuildContext context, {String msg}){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return WillPopScope(
            child: AlertDialog(
              contentPadding: EdgeInsets.all(SizeConfig.dimen_15sdp),
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(strokeWidth: SizeConfig.dimen_4sdp,),
                  Padding(padding: EdgeInsets.only(left: SizeConfig.dimen_15sdp)),
                  Text(msg != null ? msg : 'Loading... please wait!', style: TextStyleBuilder.regularMedium(),)
                ],
              ),
            ),
            onWillPop: (){}
        );
      }
  );
}

void showAlertDialog(BuildContext context, String header, String message, String okButtonTitle, VoidCallback buttonCallback){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return WillPopScope(
            child: Center(
              child: AlertDialog(
                  contentPadding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.dimen_10sdp)),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_15sdp)),
                      Text(header, style: TextStyleBuilder.mediumMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_5sdp)),
                      Text(message, style: TextStyleBuilder.regularMedium(textColor: theme_text_hint_color), textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_10sdp)),
                      Container(color: colorGray_500, height: SizeConfig.separatorWidth,),
                      FlatButton(
                        onPressed: buttonCallback,
                        color: colorWhite,
                        child: Text(okButtonTitle, style: TextStyleBuilder.regularMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                      )
                    ],
                  )
              ),
            ),
            onWillPop: (){}
        );
      }
  );
}

void showAlertDialogWith2Button(BuildContext context, String header, String message, String button1Title, String button2Title, VoidCallback button1Callback, VoidCallback button2Callback){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return WillPopScope(
            child: AlertDialog(
                contentPadding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.dimen_10sdp)),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_15sdp)),
                    Text(header, style: TextStyleBuilder.mediumMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_5sdp)),
                    Text(message, style: TextStyleBuilder.regularMedium(textColor: theme_text_hint_color), textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_10sdp)),
                    Container(color: colorGray_500, height: SizeConfig.separatorWidth,),
                    Container(
                      height: SizeConfig.dimen_50sdp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              onPressed: button2Callback,
                              color: colorWhite,
                              child: Text(button2Title, style: TextStyleBuilder.regularMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                            ),
                          ),
                          Container(width: SizeConfig.separatorWidth, color: colorGray_500,),
                          Expanded(
                            child: FlatButton(
                              onPressed: button1Callback,
                              color: colorWhite,
                              child: Text(button1Title, style: TextStyleBuilder.regularMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
            onWillPop: (){}
        );
      }
  );
}

void showAlertDialogWithRetry(BuildContext context, String header, String message, String okButtonTitle, String retryButtonTitle, VoidCallback okButtonCallback, VoidCallback retryCallback){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return WillPopScope(
            child: Center(
              child: AlertDialog(
                  contentPadding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.dimen_10sdp)),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_15sdp)),
                      Text(header, style: TextStyleBuilder.mediumMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_5sdp)),
                      Text(message, style: TextStyleBuilder.regularMedium(textColor: theme_text_hint_color), textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.only(top: SizeConfig.dimen_10sdp)),
                      Container(color: colorGray_500, height: SizeConfig.separatorWidth,),
                      Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: okButtonCallback,
                            color: colorWhite,
                            child: Text(okButtonTitle, style: TextStyleBuilder.regularMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                          ),
                          FlatButton(
                            onPressed: retryCallback,
                            color: colorWhite,
                            child: Text(retryButtonTitle, style: TextStyleBuilder.regularMedium(textColor: theme_primary_color), textAlign: TextAlign.center,),
                          )
                        ],
                      )
                    ],
                  )
              ),
            ),
            onWillPop: (){}
        );
      }
  );
}