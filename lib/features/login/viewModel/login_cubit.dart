import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<AppStates>{
   LoginCubit():super(const AppInitial());
}