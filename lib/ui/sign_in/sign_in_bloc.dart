import 'package:bloc/bloc.dart';
import 'sign_in.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  @override
  SignInState get initialState => SignInInitState();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInInitEvent) {
      yield SignInInitState();
    }
    if (event is SignInLoadingEvent) {
      yield SignInLoadingState();
    }
    if (event is SignInErrorEvent) {
      yield SignInErrorState(errorMsg: event.errorMsg);
    }
    if (event is NavigateToHomeEvent) {
      yield NavigateToHomeState();
    }
    if (event is SocialSignInResultEvent) {
      yield SocialSignInResultState(email: event.email);
    }
    if (event is SocialSignInCanceledEvent) {
      yield SocialSignInCanceledState();
    }
    if (event is NavigateToSocialSignInEvent) {
      yield NavigateToSocialSignInState(socialSignInData: event.socialSignInData);
    }
    if (event is SignInNavigateToVerifyOTPEvent) {
      yield SignInNavigateToVerifyOTPState(email: event.email, mobile: event.mobile);
    }
  }

  void signIn(String email, String password) async {
    //make api call for sign-in
  }

  Map<String, String> getRequestForSignIn(String email, String password, String token) {
    Map<String, String> request = Map();
    request['email'] = email;
    request['password'] = password;
    request['device_token'] = token;
    return request;
  }

  void fbLogin() async {
    // dispatch(SignInLoadingEvent());
    // var facebookLogin = FacebookLogin();
    // var facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);
    // switch (facebookLoginResult.status) {
    //   case FacebookLoginStatus.error:
    //     dispatch(SignInErrorEvent(errorMsg: "Some error occured, while logging in to facebook."));
    //     break;
    //   case FacebookLoginStatus.cancelledByUser:
    //     dispatch(SocialSignInCanceledEvent());
    //     break;
    //   case FacebookLoginStatus.loggedIn:
    //     var fbUser = await Repository.get().getFBUserDetails(facebookLoginResult.accessToken.token);
    //     if(fbUser != null){
    //       checkSocialDetails(fbUser['name'], fbUser['email'], fbUser['id'], fbId: fbUser['id']);
    //     }else{
    //       dispatch(SignInErrorEvent(errorMsg: "Some error occured, unable to obtain email from facebook."));
    //     }
    //     break;
    // }
  }

  void gPlusLogin() async {
    // dispatch(SignInLoadingEvent());
    // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    // try{
    //   var account = await _googleSignIn.signIn();
    //   if(account != null)
    //     checkSocialDetails(account.displayName, account.email, account.id, gPlusId: account.id);
    //   else
    //     dispatch(SocialSignInCanceledEvent());
    // }catch(e){
    //   dispatch(SignInErrorEvent(errorMsg: "Some error occured, while logging in to google."));
    // }
  }

  void checkSocialDetails(String name, String email, String socialID, {String fbId, String gPlusId}) async {
    //call api to check whether this user already exist
  }

  Map<String, String> getRequestForCheckSocialDetail(String email, String socialId, String token) {
    Map<String, String> request = Map();
    request['email'] = email;
    request['phone_number'] = '';
    request['social_id'] = socialId;
    request['device_token'] = token;
    return request;
  }
}