import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/reset_password/reset_pass_page.dart';

import 'forgot_pass.dart';

class ForgotPassPage extends BasePage<ForgotPassBloc> {
  @override
  ForgotPassBloc bloc() => ForgotPassBloc()..dispatch(ForgotPassInitEvent());

  @override
  Widget widget() => ForgotPassWidget();
}

class ForgotPassWidget extends StatefulWidget {
  @override
  _ForgotPassWidgetState createState() => _ForgotPassWidgetState();
}

class _ForgotPassWidgetState extends BaseState<ForgotPassWidget, ForgotPassBloc, ForgotPassEvent, ForgotPassState> {

  @override
  String getScreenName(BuildContext context) => 'Forgot Password';

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
    return (BuildContext context, ForgotPassState state) {
      if(state is RequestForgotPassState){
        showLoading();
      }
      else if(state is ForgotPassSuccessState){
        hideLoading();
        //TODO show dialog here
        startScreen(context, ResetPassPage(email: state.email,));
      }
      else if(state is ForgotPassFailedState){
        hideLoading();
        showErrorMsg(state.errorMsg);
      }
    };
  }
}
