import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fake_cubit_dart_state.dart';

class FakeCubitDartCubit extends Cubit<FakeCubitDartState> {
  FakeCubitDartCubit() : super(FakeCubitDartInitial());
}
