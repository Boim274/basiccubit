// buat class visibility
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityCubit extends Cubit<bool> {
  VisibilityCubit() : super(true);

  void change() => emit(!state);
}