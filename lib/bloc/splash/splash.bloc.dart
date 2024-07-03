import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/repositories/auth_repository.dart';
import 'package:furnix_store/repositories/user_repository.dart';

part 'splash.event.dart';
part 'splash.state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepository; // Your authentication service
  final UserRepository userRepository;

  SplashBloc({required this.authRepository, required this.userRepository})
      : super(SplashInitial()) {
    on<CheckLogin>(_onCheckLogin);
  }
  Future<void> _onCheckLogin(
      CheckLogin event, Emitter<SplashState> emit) async {
        final User? user = authRepository.checkUserAlreadyLoggedIn();

        if(user != null){
          final userModel = await userRepository.fetchUser(userId:user.uid);
          await Future.delayed(Duration(seconds: 2));
          return emit(LoggedIn(userModel));
        }
        else{
          await Future.delayed(Duration(seconds:2));
          return emit(NotLoggedIn());
        }
      }
}
