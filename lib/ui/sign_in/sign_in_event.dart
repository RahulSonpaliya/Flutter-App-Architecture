import 'package:meta/meta.dart';

import 'social_sign_in_data.dart';

abstract class SignInEvent {}

class SignInInitEvent extends SignInEvent {
  @override
  String toString() {
    return 'SignInInitEvent{}';
  }
}

class SignInLoadingEvent extends SignInEvent {
  @override
  String toString() {
    return 'SignInLoadingEvent{}';
  }
}

class SignInErrorEvent extends SignInEvent {
  final String errorMsg;
  SignInErrorEvent({@required this.errorMsg});
  @override
  String toString() {
    return 'SignInErrorEvent{}';
  }
}

class NavigateToHomeEvent extends SignInEvent {
  @override
  String toString() {
    return 'NavigateToHomeEvent{}';
  }
}

class NavigateToSocialSignInEvent extends SignInEvent {
  final SocialSignInData socialSignInData;
  NavigateToSocialSignInEvent({this.socialSignInData});
  @override
  String toString() {
    return 'NavigateToSocialSignInEvent{}';
  }
}

class SignInNavigateToVerifyOTPEvent extends SignInEvent {
  final String mobile, email;
  SignInNavigateToVerifyOTPEvent({this.mobile, this.email});
  @override
  String toString() {
    return 'SignInNavigateToVerifyOTPEvent{mobile: $mobile, email: $email}';
  }
}

class SocialSignInResultEvent extends SignInEvent {
  final String email;
  SocialSignInResultEvent({this.email});
  @override
  String toString() {
    return 'NavigateToHomeEvent{}';
  }
}

class SocialSignInCanceledEvent extends SignInEvent {
  @override
  String toString() {
    return 'SocialSignInCanceledEvent{}';
  }
}