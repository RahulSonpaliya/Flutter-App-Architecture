import 'package:bloc/bloc.dart';

import 'walkthrough.dart';

class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState>{

  @override
  WalkthroughState get initialState => WalkthroughInitialState();

  @override
  Stream<WalkthroughState> mapEventToState(WalkthroughEvent event) async* {
    if(event is WalkthroughInitialEvent){
      yield WalkthroughInitialState();
    }
  }
}