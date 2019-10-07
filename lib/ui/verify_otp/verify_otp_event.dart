import 'package:meta/meta.dart';

abstract class VerifyOTPEvent {}

class VerifyOTPInitEvent extends VerifyOTPEvent {
  @override
  String toString() {
    return 'VerifyOTPInitEvent{}';
  }
}

class VerifyOTPLoadingEvent extends VerifyOTPEvent {
  @override
  String toString() {
    return 'VerifyOTPLoadingEvent{}';
  }
}

class VerifyOTPErrorEvent extends VerifyOTPEvent {
  final String errorMsg;
  VerifyOTPErrorEvent({@required this.errorMsg});
  @override
  String toString() {
    return 'VerifyOTPErrorEvent{}';
  }
}

class NavigateToHomeEvent extends VerifyOTPEvent {
  @override
  String toString() {
    return 'NavigateToHomeEvent{}';
  }
}

class ResendOTPSuccessEvent extends VerifyOTPEvent {
  @override
  String toString() {
    return 'ResendOTPSuccessEvent{}';
  }
}