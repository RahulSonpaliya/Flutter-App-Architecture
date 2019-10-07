import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/app_utilities/common_utils.dart';
import 'package:flutter_app_architecture/ui/base/base.dart';
import 'package:flutter_app_architecture/ui/walkthrough/walkthrough.dart';

class WalkThroughScreen extends BasePage<WalkthroughBloc> {
  @override
  WalkthroughBloc bloc() => WalkthroughBloc()..dispatch(WalkthroughInitialEvent());
  @override
  Widget widget() => WalkThroughWidget();
}

class WalkThroughWidget extends StatefulWidget {
  WalkThroughWidget({Key key}) : super(key: key);

  _WalkThroughWidgetState createState() => _WalkThroughWidgetState();
}

class _WalkThroughWidgetState extends BaseState<WalkThroughWidget, WalkthroughBloc, WalkthroughEvent, WalkthroughState> {

  @override
  Widget getBody() {
    return Center(
      child: Text('In Progress'),
    );
  }

  @override
  String getScreenName(BuildContext context) => 'walk through screen';

  @override
  getStateListener() => (BuildContext context, WalkthroughState state){};

  @override
  Widget getAppBar() => noActionBar();
}
