abstract class ForgotPassState {}

class ForgotPassInitialState extends ForgotPassState {
  @override
  String toString() {
    return 'ForgotPassInitialState{}';
  }
}

class RequestForgotPassState extends ForgotPassState {
  @override
  String toString() {
    return 'RequestForgotPassState{}';
  }
}

class ForgotPassSuccessState extends ForgotPassState {
  final String msg, email;
  ForgotPassSuccessState({this.msg, this.email});
  @override
  String toString() {
    return 'ForgotPassSuccessState{}';
  }
}

class ForgotPassFailedState extends ForgotPassState {
  final String errorMsg;
  ForgotPassFailedState({this.errorMsg});
  @override
  String toString() {
    return 'ForgotPassFailedState{}';
  }
}