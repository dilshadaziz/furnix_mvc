import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';
import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class SignUpwithEmailAndPasswordUseCase {
  final FirebaseRepository repository;

  SignUpwithEmailAndPasswordUseCase({required this.repository});

  Future<void> call (UserEntity userEntity){
    return repository.signUpWithEmailAndPassword(userEntity);
  }
}