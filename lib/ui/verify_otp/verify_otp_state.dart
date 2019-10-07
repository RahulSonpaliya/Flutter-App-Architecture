import 'package:meta/meta.dart';

abstract class VerifyOTPState {}

class VerifyOTPInitState extends VerifyOTPState {
  @override
  String toString() {
    return 'VerifyOTPInitState{}';
  }
}

class VerifyOTPLoadingState extends VerifyOTPState {
  @override
  String toString() {
    return 'VerifyOTPLoadingState{}';
  }
}

class VerifyOTPErrorState extends VerifyOTPState {
  final String errorMsg;
  VerifyOTPErrorState({@required this.errorMsg});
  @override
  String toString() {
    return 'VerifyOTPErrorState{}';
  }
}

class NavigateToHomeState extends VerifyOTPState {
  @override
  String toString() {
    return 'NavigateToHomeState{}';
  }
}

class ResendOTPSuccessState extends VerifyOTPState {
  @override
  String toString() {
    return 'ResendOTPSuccessState{}';
  }
}