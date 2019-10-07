abstract class SignUpState {}

class SignUpInitState extends SignUpState {
  @override
  String toString() {
    return 'SignUpInitialState{}';
  }
}

class SignUpLoadingState extends SignUpState {
  @override
  String toString() {
    return 'SignUpLoadingState{}';
  }
}

class NavigateToVerifyOTPState extends SignUpState {
  final String mobile, email;
  NavigateToVerifyOTPState({this.mobile, this.email});
  @override
  String toString() {
    return 'NavigateToVerifyOTPState{mobile: $mobile, email: $email}';
  }
}

class SignUpErrorState extends SignUpState {
  final String errorMsg;
  SignUpErrorState({this.errorMsg});
  @override
  String toString() {
    return 'SignUpErrorState{}';
  }
}