import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';

import 'verify_otp.dart';

class VerifyOTPPage extends BasePage<VerifyOTPBloc> {
  final String mobile, email;
  VerifyOTPPage({this.mobile, this.email});
  @override
  VerifyOTPBloc bloc() => VerifyOTPBloc()..dispatch(VerifyOTPInitEvent());
  @override
  Widget widget() => VerifyOTPWidget(mobile: mobile, email: email,);
}

class VerifyOTPWidget extends StatefulWidget {
  final String mobile, email;
  VerifyOTPWidget({this.mobile, this.email});
  @override
  _VerifyOTPWidgetState createState() => _VerifyOTPWidgetState();
}

class _VerifyOTPWidgetState extends BaseState<VerifyOTPWidget, VerifyOTPBloc, VerifyOTPEvent, VerifyOTPState> {

  @override
  String getScreenName(BuildContext context) => 'Verify OTP';

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
    return (BuildContext context, VerifyOTPState state) {
      if(state is VerifyOTPLoadingState){
        showLoading();
      }
      else if(state is NavigateToHomeState){
        hideLoading();
      }
      else if(state is VerifyOTPErrorState){
        hideLoading();
        showErrorMsg(state.errorMsg);
      }
      else if(state is ResendOTPSuccessState){
        hideLoading();
        //
      }
    };
  }
}