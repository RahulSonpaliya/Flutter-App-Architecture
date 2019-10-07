import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/walkthrough/walkthrough_page.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'splash.dart';

class SplashScreen extends BasePage<SplashBloc> {
  @override
  SplashBloc bloc() => SplashBloc()..dispatch(SplashInitialEvent());
  @override
  Widget widget() => SplashWidget();
}

class SplashWidget extends StatefulWidget{
  @override
  State createState() {
    return SplashWidgetState();
  }
}

class SplashWidgetState extends BaseState<SplashWidget, SplashBloc, SplashEvent, SplashState>{
  @override
  String getScreenName(BuildContext context) => 'Splash';

  @override
  Widget getBody() {
    return Center(
      child: Text('In Progress'),
    );
  }

  @override
  getStateListener() {
    return (BuildContext context, SplashState state){
      if(state is NavigateToHomeState){
        //navigate to home screen
      }else if(state is NavigateToWalkThroughState){
        //navigate to walk-through screen
        startScreenAndKillAll(context, screen: WalkThroughScreen());
      }
    };
  }

  @override
  Widget getAppBar() => noActionBar();
}