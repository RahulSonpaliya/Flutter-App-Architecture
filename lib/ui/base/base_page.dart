import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<T extends Bloc> extends StatelessWidget{

  T bloc();
  Widget widget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context){
        return bloc();
      },
      child: widget(),
    );
  }
}