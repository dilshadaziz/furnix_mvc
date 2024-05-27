import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class IsSignedInUseCase {
  final FirebaseRepository repository;

  IsSignedInUseCase({required this.repository});

  Future<bool> call(){
    return repository.isSignedIn();
  }
}