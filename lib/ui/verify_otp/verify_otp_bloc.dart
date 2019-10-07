import 'package:bloc/bloc.dart';

import 'verify_otp.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {

  @override
  VerifyOTPState get initialState => VerifyOTPInitState();

  @override
  Stream<VerifyOTPState> mapEventToState(VerifyOTPEvent event) async* {
    if (event is VerifyOTPInitEvent) {
      yield VerifyOTPInitState();
    }
    if (event is VerifyOTPLoadingEvent) {
      yield VerifyOTPLoadingState();
    }
    if (event is VerifyOTPErrorEvent) {
      yield VerifyOTPErrorState(errorMsg: event.errorMsg);
    }
    if (event is NavigateToHomeEvent) {
      yield NavigateToHomeState();
    }
    if (event is ResendOTPSuccessEvent) {
      yield ResendOTPSuccessState();
    }
  }

  void verifyOTP(String code, String mobile) async {
    //call api to verify otp
  }

  void resendOTP(String email, String mobile) async {
    //call api to resend otp
  }

  Map<String, String> getRequestForVerifyCode(String code, String mobileNumber, String token) {
    Map<String, String> request = Map();
    request['phone_number'] = mobileNumber;
    request['otp'] = code;
    request['device_token'] = token;
    return request;
  }

  Map<String, String> getRequestForResendCode(String email, String mobileNumber) {
    Map<String, String> request = Map();
    request['phone_number'] = mobileNumber;
    return request;
  }
}