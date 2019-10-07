import 'package:bloc/bloc.dart';

import 'forgot_pass.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {

  @override
  ForgotPassState get initialState => ForgotPassInitialState();

  @override
  Stream<ForgotPassState> mapEventToState(ForgotPassEvent event) async* {
    if (event is ForgotPassInitEvent) {
      yield ForgotPassInitialState();
    }
    if (event is ForgotPassLoadingEvent) {
      yield RequestForgotPassState();
    }
    if (event is ForgotPassSuccessEvent) {
      yield ForgotPassSuccessState(msg: event.msg, email: event.email);
    }
    if (event is ForgotPassErrorEvent) {
      yield ForgotPassFailedState();
    }
  }

  void forgotPassword(String email) {
    // call forgot-password api
  }
}