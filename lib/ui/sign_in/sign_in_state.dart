import 'package:flutter_app_architecture/ui/sign_in/social_sign_in_data.dart';
import 'package:meta/meta.dart';

abstract class SignInState {}

class SignInInitState extends SignInState {
  @override
  String toString() {
    return 'SignInInitState{}';
  }
}

class SignInLoadingState extends SignInState {
  @override
  String toString() {
    return 'SignInLoadingState{}';
  }
}

class SignInErrorState extends SignInState {
  final String errorMsg;
  SignInErrorState({@required this.errorMsg});
  @override
  String toString() {
    return 'SignInErrorState{}';
  }
}

class NavigateToHomeState extends SignInState {
  @override
  String toString() {
    return 'NavigateToHomeState{}';
  }
}

class NavigateToSocialSignInState extends SignInState {
  final SocialSignInData socialSignInData;
  NavigateToSocialSignInState({this.socialSignInData});
  @override
  String toString() {
    return 'NavigateToSocialSignInState{}';
  }
}

class SignInNavigateToVerifyOTPState extends SignInState {
  final String mobile, email;
  SignInNavigateToVerifyOTPState({this.mobile, this.email});
  @override
  String toString() {
    return 'SignInNavigateToVerifyOTPState{mobile: $mobile, email: $email}';
  }
}

class SocialSignInResultState extends SignInState {
  final String email;
  SocialSignInResultState({this.email});
  @override
  String toString() {
    return 'NavigateToHomeState{}';
  }
}

class SocialSignInCanceledState extends SignInState {
  @override
  String toString() {
    return 'SocialSignInCanceledState{}';
  }
}