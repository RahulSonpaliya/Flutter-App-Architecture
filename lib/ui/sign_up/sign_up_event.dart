abstract class SignUpEvent {}

class SignUpInitEvent extends SignUpEvent {
  @override
  String toString() {
    return 'SignUpInitEvent{}';
  }
}

class SignUpLoadingEvent extends SignUpEvent {
  @override
  String toString() {
    return 'SignUpLoadingEvent{}';
  }
}

class NavigateToVerifyOTPEvent extends SignUpEvent {
  final String mobile, email;
  NavigateToVerifyOTPEvent({this.mobile, this.email});
  @override
  String toString() {
    return 'NavigateToVerifyOTPEvent{}';
  }
}

class SignUpErrorEvent extends SignUpEvent {
  final String errorMsg;
  SignUpErrorEvent({this.errorMsg});

  @override
  String toString() {
    return 'SignUpErrorEvent{}';
  }
}