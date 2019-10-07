import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/verify_otp/verify_otp_page.dart';

import '../social_sign_in_data.dart';
import 'social_sign_in.dart';

class SocialSignInPage extends BasePage<SocialSignInBloc> {
  final SocialSignInData socialSignInData;
  SocialSignInPage(this.socialSignInData);
  @override
  SocialSignInBloc bloc() => SocialSignInBloc()..dispatch(SocialSignInInitEvent());
  @override
  Widget widget() => SocialSignInWidget(socialSignInData);
}

class SocialSignInWidget extends StatefulWidget {
  final SocialSignInData socialSignInData;
  SocialSignInWidget(this.socialSignInData);
  @override
  _SocialSignInWidgetState createState() => _SocialSignInWidgetState();
}

class _SocialSignInWidgetState extends BaseState<SocialSignInWidget, SocialSignInBloc, SocialSignInEvent, SocialSignInState> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();

  @override
  getStateListener() {
    return (BuildContext context, SocialSignInState state) {
      if(state is SocialSignInLoadingState){
        showLoading();
      }
      else if(state is SocialSignInNavigateHomeState){
        hideLoading();
      }
      else if(state is SocialSignInNavigateToVerifyOTPState){
        hideLoading();
        startScreen(context, VerifyOTPPage(mobile: state.mobile, email: state.email));
      }
      else if(state is SocialSignInErrorState){
        hideLoading();
        showErrorMsg(state.errorMsg);
      }
    };
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.socialSignInData.name;
    emailController.text = widget.socialSignInData.email;
    mobileController.text = widget.socialSignInData.mobileNumber;
  }

  @override
  String getScreenName(BuildContext context) => 'Social Sign In';

  @override
  Widget getAppBar() => noActionBar();

  @override
  Widget getBody(){
    return Center(
      child: Text('In Progress')
    );
  }
}
