abstract class ResetPassEvent {}

class ResetPassInitEvent extends ResetPassEvent {
  @override
  String toString() {
    return 'ResetPassInitEvent{}';
  }
}

class ResetPassLoadingEvent extends ResetPassEvent {
  @override
  String toString() {
    return 'ResetPassLoadingEvent{}';
  }
}

class ResetPassSuccessEvent extends ResetPassEvent {
  final String msg;
  final bool navigateToSignIn;
  ResetPassSuccessEvent({this.msg, this.navigateToSignIn});
  @override
  String toString() {
    return 'ResetPassSuccessEvent{}';
  }
}

class ResetPassErrorEvent extends ResetPassEvent {
  final String errorMsg;
  ResetPassErrorEvent({this.errorMsg});
  @override
  String toString() {
    return 'ResetPassErrorEvent{}';
  }
}