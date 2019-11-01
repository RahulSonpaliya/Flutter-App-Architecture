import 'dart:ui';

mixin LoadingState{}
mixin SessionExpiryState{
  String get errorMsg;
}
mixin ErrorState{
  String get errorMsg;
  String get dialogButtonTitleKey;
  VoidCallback get dialogButtonCallback;
}