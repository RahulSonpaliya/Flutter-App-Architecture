import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/verify_otp/verify_otp.dart';

import 'sign_up.dart';

class SignUpPage extends BasePage<SignUpBloc> {
  @override
  SignUpBloc bloc() => SignUpBloc()..dispatch(SignUpInitEvent());
  @override
  Widget widget() => SignUpWidget();
}

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends BaseState<SignUpWidget, SignUpBloc, SignUpEvent, SignUpState> {

  @override
  String getScreenName(BuildContext context) => 'Sign Up';

  bool resizeToAvoidBottomPadding() => true;

  @override
  getStateListener() {
    return (BuildContext context, SignUpState state){
      if(state is SignUpLoadingState){
        showLoading();
      }
      else if(state is NavigateToVerifyOTPState){
        hideLoading();
        startScreen(context, VerifyOTPPage(mobile: state.mobile, email: state.email));
      }
      else if(state is SignUpErrorState){
        hideLoading();
        showErrorMsg(state.errorMsg);
      }
    };
  }

  @override
  Widget getBody() {
    return Center(
      child: Text('In Progress'),
    );
  }

  @override
  Widget getAppBar() => noActionBar();
}
