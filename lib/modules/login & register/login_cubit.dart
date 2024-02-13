import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    emit(ChangePasswordVisibilityState());
  }
}