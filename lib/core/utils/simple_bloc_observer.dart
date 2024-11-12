import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("bloc   $bloc  changed $change");
  }

  @override
  void onClose(BlocBase bloc) {
    log("closed  $bloc ");
  }

  @override
  void onCreate(BlocBase bloc) {
    log("Create bloc  $bloc ");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("bloc $bloc -- trans $transition");
  }
}
