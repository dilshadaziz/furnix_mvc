import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import '../../repositories/user_repository.dart';



part 'user.event.dart';
part 'user.state.dart';
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield UserLoading();
      try {
        final user = await userRepository.fetchUser();
        yield UserLoaded(user: user);
      } catch (e) {
        yield UserError(message: e.toString());
      }
    }
  }
}
