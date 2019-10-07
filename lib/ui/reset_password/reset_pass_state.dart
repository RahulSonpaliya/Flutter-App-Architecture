abstract class ResetPassState {}

class ResetPassInitialState extends ResetPassState {
  @override
  String toString() {
    return 'ResetPassInitialState{}';
  }
}

class RequestResetPassState extends ResetPassState {
  @override
  String toString() {
    return 'RequestResetPassState{}';
  }
}

class ResetPassSuccessState extends ResetPassState {
  final String msg;
  final bool navigateToSignIn;
  ResetPassSuccessState({this.msg, this.navigateToSignIn});
  @override
  String toString() {
    return 'ResetPassSuccessState{}';
  }
}

class ResetPassFailedState extends ResetPassState {
  final String errorMsg;
  ResetPassFailedState({this.errorMsg});

  @override
  String toString() {
    return 'ResetPassFailedState{}';
  }
}