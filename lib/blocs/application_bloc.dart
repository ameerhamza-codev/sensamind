import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwatch/utils/app_logger.dart';

abstract class AppBlocEvent {}

abstract class AppBlocState {
  bool get loading;
}

class StateReducer<E extends AppBlocEvent, S extends AppBlocState> {
  StateReducer(this.handler) : assert(handler != null);

  final Stream<S> Function(E) handler;

  Stream<S> call(E event) => handler(event);
}

abstract class ApplicationBloc<E extends AppBlocEvent, S extends AppBlocState>
    extends Bloc<E, S> {
  ApplicationBloc(S initialState) : super(initialState);

  AppLogger _log;

  bool get enableLogging => false;

  AppLogger get log {
    _log ??= AppLogger(tag: '$runtimeType');
    return _log;
  }

  @override
  void onTransition(Transition<E, S> transition) {
    super.onTransition(transition);
//    log.i(transition.currentState);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('$error\n$stackTrace');
  }

  @protected
  Map<Type, StateReducer<E, S>> get handlers;

  @override
  @protected
  S get state => super.state;

  @protected
  S setLoading(bool isLoading);

  @override
  Stream<S> mapEventToState(E event) => stateFromHandlers(event);

  @protected
  Stream<S> stateFromHandlers(E event) {
    return _stateFromHandlers(event).asBroadcastStream();
  }

  Stream<S> _stateFromHandlers(E event) async* {
//    log.i('Started: $event');
    yield setLoading(true);
    final StateReducer<E, S> reducer = handlers[event.runtimeType];
    if (reducer != null) {
      yield* reducer(event);
    } else {
      log.e('No handler defined for $event in $runtimeType');
    }
    yield setLoading(false);
//    log.i('Completed: $runtimeType');
  }
}
