import 'package:bloc/bloc.dart';
import 'package:bookstore/features/register/data/repo/register_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register({
    required String email,
    required String name,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoading());
    final response = await RegisterRepo.register(
      email: email,
      name: name,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

    if (response) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterErorr());
    }
  }
}
