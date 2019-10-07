import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/app_utilities/size_config.dart';
import 'package:flutter_app_architecture/ui/walkthrough/walkthrough.dart';

///this widget is used because, in release (or production) environment 'MediaQuery' takes more time to initialise than the dart platform
///this is a known issue related with 'MediaQuery' in flutter to deal with this issue we need to first launch a screen in which we need
///to prepare 'MediaQuery' first and than we will proceed to our app.
///https://github.com/flutter/flutter/issues/25827
class PrepareMediaQueryWidget extends StatefulWidget {
  @override
  _PrepareMediaQueryWidgetState createState() => _PrepareMediaQueryWidgetState();
}

class _PrepareMediaQueryWidgetState extends State<PrepareMediaQueryWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    ///work around for issue related to MediaQuery in the release environment
    ///https://github.com/flutter/flutter/issues/25827
    return FutureBuilder(
        future: whenNotZero(
          Stream<double>.periodic(Duration(milliseconds: 50),
                  (x) => SizeConfig.safeBlockHorizontal),
        ),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData && snapshot.data > 0){
            Future.delayed(Duration(milliseconds: 3000), (){
              startScreenAndKillAll(context, screen: WalkThroughScreen());
            });
          }else{
            SizeConfig.init(context);
          }
          return Scaffold(
            body: Center(
                child: Text('Splash'),
              ),
          );
        }
    );
  }
}

///work around for issue related to MediaQuery in the release environment
///https://github.com/flutter/flutter/issues/25827
Future<double> whenNotZero(Stream<double> source) async {
  await for (double value in source) {
    if (value > 0) {
      return value;
    }
  }
  // stream exited without a true value, maybe return an exception.
}