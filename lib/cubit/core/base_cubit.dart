import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initialState) : super(initialState);

  void handleError(String errorMessage);

  Future<void> performSafeAction(AsyncValueGetter callback) async {
    try {
      return await callback();
    } catch (exception) {
      handleError('$exception');
      log('$exception');
    }
  }
}
