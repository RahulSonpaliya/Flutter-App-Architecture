import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/sign_in/sign_in_page.dart';

import 'reset_pass.dart';

class ResetPassPage extends BasePage<ResetPassBloc> {
  final String email;
  ResetPassPage({this.email});

  @override
  ResetPassBloc bloc() => ResetPassBloc()..dispatch(ResetPassInitEvent());

  @override
  Widget widget() => ResetPassWidget(email: email);
}

class ResetPassWidget extends StatefulWidget {
  final String email;
  ResetPassWidget({this.email});
  @override
  _ResetPassWidgetState createState() => _ResetPassWidgetState();
}

class _ResetPassWidgetState extends BaseState<ResetPassWidget, ResetPassBloc, ResetPassEvent, ResetPassState> {

  @override
  String getScreenName(BuildContext context) => 'Reset Password';

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
    return (BuildContext context, ResetPassState state) {
      if(state is RequestResetPassState){
        showLoading();
      }
      else if(state is ResetPassSuccessState){
        hideLoading();
        //TODO show dialog here
        if(state.navigateToSignIn)
          startScreenAndKillAll(context, screen: SignInPage());
      }
      else if(state is ResetPassFailedState){
        hideLoading();
        showErrorMsg(state.errorMsg);
      }
    };
  }
}