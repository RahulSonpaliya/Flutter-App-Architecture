import 'package:bloc/bloc.dart';
import 'splash.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState>{

  @override
  SplashState get initialState => SplashInitialState();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if(event is SplashInitialEvent){
      yield SplashInitialState();
      //display ui.splash for 3 seconds
      await Future.delayed(Duration(seconds: 3));
      bool userLoggedIn = false; //check whether user is logged in
      if(userLoggedIn){
        dispatch(NavigateToHomeEvent());
      }else{
        dispatch(NavigateToWalkThroughEvent());
      }
    }
    if(event is NavigateToHomeEvent){
      yield NavigateToHomeState();
    }
    if(event is NavigateToWalkThroughEvent){
      yield NavigateToWalkThroughState();
    }
  }
}