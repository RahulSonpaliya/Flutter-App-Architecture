import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/app_utilities/dialog_utils.dart';
import 'package:flutter_app_architecture/app_utilities/localization.dart';
import 'package:flutter_app_architecture/app_utilities/style.dart';
import 'package:flutter_app_architecture/data/local/app_shared_prefs.dart';
import 'package:flutter_app_architecture/data/remote/parser.dart';
import 'package:flutter_app_architecture/data/remote/repository.dart';
import 'package:flutter_app_architecture/ui/sign_in/sign_in_page.dart';
import 'package:flutter_app_architecture/ui/walkthrough/walkthrough_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';
import 'package:connectivity/connectivity.dart';

import 'common_state.dart';

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

  void showErrorMsg(String msg, {String header, VoidCallback onRetry, String dialogButtonTitleKey}){
    String headerText = localizeString('app_name');
    if(header != null){
      headerText = header;
    }
    if(onRetry != null){
      String dialogButtonTitle = localizeString('retry');
      if(dialogButtonTitleKey != null){
        dialogButtonTitle = localizeString(dialogButtonTitleKey);
      }
      showAlertDialog(context, headerText, msg, dialogButtonTitle, (){
        hideErrorMsg();
        onRetry();
      });
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

  void showOkCancelDialog(String message, VoidCallback okButtonCallback, {String header, String okButtonTitle, String cancelButtonTitle, VoidCallback cancelButtonCallback}){
    String headerText = localizeString('app_name');
    if(header != null){
      headerText = header;
    }
    if(cancelButtonCallback == null){
      cancelButtonCallback = hideErrorMsg;
    }
    if(okButtonTitle == null){
      okButtonTitle = localizeString('ok');
    }
    if(cancelButtonTitle == null){
      cancelButtonTitle = localizeString('cancel_caps');
    }
    showAlertDialogWith2Button(context, headerText, message, okButtonTitle, cancelButtonTitle, okButtonCallback, cancelButtonCallback);
  }

  void showOkDialog(String message, VoidCallback okButtonCallback, {String header, String okButtonTitle}){
    String headerText = localizeString('app_name');
    if(header != null){
      headerText = header;
    }
    if(okButtonCallback == null){
      okButtonCallback = hideErrorMsg;
    }
    showAlertDialog(context, headerText, message, localizeString('ok'), okButtonCallback);
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

  Future<bool> onWillPop() {
    return new Future<bool>(() => true);
  }

  Widget buildMainWidget(){
    return WillPopScope(
      child: Scaffold(
        key: scaffoldKey,
        appBar: getAppBar(),
        body: SafeArea(
          child: getBody(),
        ),
        drawer: getDrawer(),
        backgroundColor: getBGColor(),
        resizeToAvoidBottomPadding: resizeToAvoidBottomPadding(),
      ),
      onWillPop: onWillPop,
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

  void checkState(S state){
    if(state is LoadingState){
      showLoading();
    }
    else if(state is ErrorState){
      hideLoading();
      showErrorMsg(state.errorMsg, onRetry: state.dialogButtonCallback, dialogButtonTitleKey: state.dialogButtonTitleKey);
    }
    else if(state is SessionExpiryState){
      hideLoading();
      showErrorMsg(state.errorMsg, dialogButtonTitleKey: 'logout', onRetry: logoutSuccess);
    }
  }

  void logoutSuccess() async {
    await AppSharedPrefs.get().clearSharedPreference();
    startScreenAndKillAll(context, screen: WalkThroughScreen());
  }

  void logout() async {
    showLoading();
    Repository.get().logout(NetworkResponseCallBack(
        onSuccessCallBack: (response) async {
          if(mounted){
            hideLoading();
            if(response.success){
              logoutSuccess();
            }else{
              showErrorMsg(response.message);
            }
          }
        },
        onServerErrorCallBack: (errorMsg){
          if(mounted){
            hideLoading();
            showErrorMsg(errorMsg);
          }
        },
    ));
  }
}