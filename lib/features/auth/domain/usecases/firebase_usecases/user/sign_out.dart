import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class SignOutUseCase {
  final FirebaseRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call(){
    return repository.signOut();
  }
}