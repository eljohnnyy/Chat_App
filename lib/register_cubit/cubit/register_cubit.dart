import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> Register_page(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(message: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(
            message: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFailure(message: 'something went wrong'));
    }
  }
}
