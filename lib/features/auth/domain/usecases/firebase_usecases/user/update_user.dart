import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';
import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class UpdateUserUseCase {
  final FirebaseRepository repository;

  UpdateUserUseCase({required this.repository});

  Future<void> call (UserEntity userEntity){
    return repository.updateUser(userEntity);
  }
}