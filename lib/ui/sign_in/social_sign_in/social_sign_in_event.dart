abstract class SocialSignInEvent {}

class SocialSignInInitEvent extends SocialSignInEvent {
  @override
  String toString() {
    return 'SocialSignInInitEvent{}';
  }
}

class SocialSignInLoadingEvent extends SocialSignInEvent {
  @override
  String toString() {
    return 'SocialSignInLoadingEvent{}';
  }
}

class SocialSignInNavigateHomeEvent extends SocialSignInEvent {
  @override
  String toString() {
    return 'SocialSignInNavigateHomeEvent{}';
  }
}

class SocialSignInNavigateToVerifyOTPEvent extends SocialSignInEvent {
  final String mobile, email;
  SocialSignInNavigateToVerifyOTPEvent({this.mobile, this.email});
  @override
  String toString() {
    return 'SocialSignInNavigateToVerifyOTPEvent{}';
  }
}

class SocialSignInErrorEvent extends SocialSignInEvent {
  final String errorMsg;
  SocialSignInErrorEvent({this.errorMsg});
  @override
  String toString() {
    return 'SocialSignInErrorEvent{}';
  }
}