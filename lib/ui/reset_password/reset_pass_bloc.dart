import 'package:bloc/bloc.dart';

import 'reset_pass.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {

  @override
  ResetPassState get initialState => ResetPassInitialState();

  @override
  Stream<ResetPassState> mapEventToState(ResetPassEvent event) async* {
    if (event is ResetPassInitEvent) {
      yield ResetPassInitialState();
    }
    if (event is ResetPassLoadingEvent) {
      yield RequestResetPassState();
    }
    if (event is ResetPassSuccessEvent) {
      yield ResetPassSuccessState(msg: event.msg, navigateToSignIn: event.navigateToSignIn);
    }
    if (event is ResetPassErrorEvent) {
      yield ResetPassFailedState(errorMsg: event.errorMsg);
    }
  }

  void resetPassword(String code, String password){
    //call reset-password api
  }

  Map<String, String> getRequestForResetPass(String code, String password) {
    Map<String, String> request = Map();
    request['code'] = code;
    request['password'] = password;
    return request;
  }

  void resendCode(String email) {
    // call resent-code api
  }
}