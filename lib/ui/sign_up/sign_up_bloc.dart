import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  @override
  SignUpState get initialState => SignUpInitState();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpInitEvent) {
      yield SignUpInitState();
    }
    if (event is SignUpLoadingEvent) {
      yield SignUpLoadingState();
    }
    if (event is NavigateToVerifyOTPEvent) {
      yield NavigateToVerifyOTPState(mobile: event.mobile, email: event.email);
    }
    if (event is SignUpErrorEvent) {
      yield SignUpErrorState(errorMsg: event.errorMsg);
    }
  }

  void signUp({@required String email, @required String password, @required String name, @required String mobile}) {
    //call sign-up api
  }

  Map<String, String> getRequestBodyForSignUp({@required String email, @required String password, @required String name, @required String mobile}){
    Map<String, String> request = Map();
    request['name'] = name;
    request['email'] = email;
    request['phone_number'] = mobile;
    request['password'] = password;
    return request;
  }
}