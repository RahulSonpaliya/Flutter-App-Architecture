import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/verify_otp/verify_otp_page.dart';

import 'sign_in.dart';
import 'social_sign_in/social_sign_in.dart';

class SignInPage extends BasePage<SignInBloc> {
  @override
  SignInBloc bloc() => SignInBloc()..dispatch(SignInInitEvent());
  @override
  Widget widget() => SignInWidget();
}

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends BaseState<SignInWidget, SignInBloc, SignInEvent, SignInState> {

  @override
  String getScreenName(BuildContext context) => 'Sign In';

  @override
  Widget getBody() {
    return Center(
      child: Text('In Progress'),
    );
  }

  @override
  Widget getAppBar() => noActionBar();

  @override
  getStateListener() {
    return (BuildContext context, SignInState state) {
      if(state is SignInLoadingState){
        showLoading();
      }
      else if(state is NavigateToHomeState){
        hideLoading();
      }
      else if(state is SignInErrorState){
        hideLoading();
        showErrorMsg(state.errorMsg);
      }
      else if(state is SocialSignInResultState){
        hideLoading();
      }
      else if(state is SocialSignInCanceledState){
        hideLoading();
      }
      else if(state is NavigateToSocialSignInState){
        hideLoading();
        startScreen(context, SocialSignInPage(state.socialSignInData));
      }
      else if(state is SignInNavigateToVerifyOTPState){
        hideLoading();
        startScreen(context, VerifyOTPPage(mobile: state.mobile, email: state.email));
      }
    };
  }
}