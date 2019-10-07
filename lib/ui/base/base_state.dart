import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/app_utilities/dialog_utils.dart';
import 'package:flutter_app_architecture/app_utilities/localization.dart';
import 'package:flutter_app_architecture/app_utilities/style.dart';
import 'package:flutter_app_architecture/data/local/app_shared_prefs.dart';
import 'package:flutter_app_architecture/ui/sign_in/sign_in_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:connectivity/connectivity.dart';

abstract class BaseState<T extends StatefulWidget, B extends Bloc<E, S>, E, S> extends State<T>{
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  B getBloc() => BlocProvider.of<B>(context);

  BlocWidgetListener<S> getStateListener();

  Widget getBody();

  Widget getAppBar() => AppBar(title: Text(getScreenName(context)),);

  String getScreenName(BuildContext context);

  void showLoading({String msg}) => showLoadingIndicator(context, msg: msg);

  void hideLoading() => Navigator.pop(context);

  void hideErrorMsg() => Navigator.pop(context);

  void showErrorMsg(String msg, {String header, VoidCallback onRetry}){
    String headerText = localizeString('app_name');
    if(header != null){
      headerText = header;
    }
    if(onRetry != null){
      showAlertDialogWithRetry(context, headerText, msg, localizeString('ok'),
          localizeString('retry'), hideErrorMsg, onRetry);
    }else{
      showAlertDialog(context, headerText, msg, localizeString('ok'), hideErrorMsg);
    }
  }

  void showSessionExpireAlert({String msg}) {
    showAlertDialog(context, localizeString('app_name'), localizeString('unauthorized_access'), localizeString('ok'), () async {
      await AppSharedPrefs.get().clearSharedPreference();
      startScreenAndKillAll(context, screen: SignInPage());
    });
  }

  void showToast(String msg){
    Toast.show(msg, context, duration: Toast.LENGTH_LONG);
  }

  Color getBGColor() => colorWhite;

  @override
  Widget build(BuildContext context) {
    return BlocListener<E, S>(
      bloc: getBloc(),
      listener: getStateListener(),          
      child: buildMainWidget(),
    );
  }

  Widget buildMainWidget(){    
    return Scaffold(
      key: scaffoldKey,
      appBar: getAppBar(), 
      body: SafeArea(
        child: getBody(),
      ),
      drawer: getDrawer(),
      backgroundColor: getBGColor(), 
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding(),
    );
  }

  Widget getDrawer() => null;

  bool resizeToAvoidBottomPadding() => false;

  Future<bool> isInternetOn() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }

  Future<bool> checkIfInternetAvailable() async {
    bool isConnected = await isInternetOn();
    if(!isConnected){
      showToast(localizeString('internet_connection_msg'));
    }
    return isConnected;
  }

  String localizeString(String key) => AppLocalizations.of(context).getAny(key);

  void showValidationError(String msg) => showToast(msg);
}