abstract class ForgotPassEvent {}

class ForgotPassInitEvent extends ForgotPassEvent {
  @override
  String toString() {
    return 'ForgotPassInitEvent{}';
  }
}

class ForgotPassLoadingEvent extends ForgotPassEvent {
  @override
  String toString() {
    return 'ForgotPassLoadingEvent{}';
  }
}

class ForgotPassSuccessEvent extends ForgotPassEvent {
  final String msg, email;
  ForgotPassSuccessEvent({this.msg, this.email});
  @override
  String toString() {
    return 'ForgotPassSuccessEvent{}';
  }
}

class ForgotPassErrorEvent extends ForgotPassEvent {
  final String errorMsg;
  ForgotPassErrorEvent({this.errorMsg});
  @override
  String toString() {
    return 'ForgotPassErrorEvent{}';
  }
}