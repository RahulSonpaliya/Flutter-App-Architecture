import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/size_config.dart';
import 'package:flutter_app_architecture/app_utilities/style.dart';

void showLoadingIndicator(BuildContext context, {String msg}){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return WillPopScope(
            child: Center(
              child: AlertDialog(
                content: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(padding: EdgeInsets.only(left: SizeConfig.dimen_15sdp)),
                        Text(msg != null ? msg : 'Loading... please wait!')
                      ],
                    )
                  ],
                ),
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