import 'package:bloc/bloc.dart';

import 'social_sign_in.dart';

class SocialSignInBloc extends Bloc<SocialSignInEvent, SocialSignInState> {

  @override
  SocialSignInState get initialState => SocialSignInInitState();

  @override
  Stream<SocialSignInState> mapEventToState(SocialSignInEvent event) async* {
    if (event is SocialSignInInitEvent) {
      yield SocialSignInInitState();
    }
    if (event is SocialSignInLoadingEvent) {
      yield SocialSignInLoadingState();
    }
    if (event is SocialSignInNavigateHomeEvent) {
      yield SocialSignInNavigateHomeState();
    }
    if (event is SocialSignInNavigateToVerifyOTPEvent) {
      yield SocialSignInNavigateToVerifyOTPState(email: event.email, mobile: event.mobile);
    }
    if (event is SocialSignInErrorEvent) {
      yield SocialSignInErrorState(errorMsg: event.errorMsg);
    }
  }

  void socialSignUp(String fbId, String gPlusId) async {
    //make api call for social sign up
  }

  Map<String, String> getRequestForSocialSignUp(String fbId, String gPlusId) {
    Map<String, String> request = Map();
    //TODO prepare request
    return request;
  }
}