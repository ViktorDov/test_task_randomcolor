import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final Random _random = Random();
  void changeColor() {
    final newColor = Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
    emit(
      state.copyWith(color: newColor),
    );
  }

  void changeTextSize() {
    final newTextSize = _random.nextDouble() * 80;
    emit(
      state.copyWith(textSize: newTextSize),
    );
  }

  MainScreenCubit() : super(const MainScreenState());
}
