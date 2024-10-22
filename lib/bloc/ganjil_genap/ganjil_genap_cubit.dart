import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'ganjil_genap_state.dart';

class GanjilGenapCubit extends Cubit<int> {
  GanjilGenapCubit() : super(9);

  void hitungGanjilGenap(int i) {
    emit((state + i) % 2);
  }
}
