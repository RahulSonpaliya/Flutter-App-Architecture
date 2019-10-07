abstract class SocialSignInState {}

class SocialSignInInitState extends SocialSignInState {
  @override
  String toString() {
    return 'SocialSignInInitState{}';
  }
}

class SocialSignInLoadingState extends SocialSignInState {
  @override
  String toString() {
    return 'SocialSignInLoadingState{}';
  }
}

class SocialSignInNavigateHomeState extends SocialSignInState {
  @override
  String toString() {
    return 'SocialSignInNavigateHomeState{}';
  }
}

class SocialSignInNavigateToVerifyOTPState extends SocialSignInState {
  final String mobile, email;
  SocialSignInNavigateToVerifyOTPState({this.mobile, this.email});
  @override
  String toString() {
    return 'SocialSignInNavigateToVerifyOTPState{}';
  }
}

class SocialSignInErrorState extends SocialSignInState {
  final String errorMsg;
  SocialSignInErrorState({this.errorMsg});
  @override
  String toString() {
    return 'SocialSignInErrorState{}';
  }
}