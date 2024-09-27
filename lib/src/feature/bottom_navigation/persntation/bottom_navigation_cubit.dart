import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit()
      : super(const BottomNavigationInitial(
          0,
        ));

  updateIndex(int index) {
    try {
      emit(BottomNavigationInitial(
        index,
      ));
    } catch (e) {
      final message = e.toString();
      emit(BottomNavigationFailed(message));
    }
  }
}
