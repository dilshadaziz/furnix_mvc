import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';
import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class GetAllUsersUseCase {
  final FirebaseRepository repository;

  GetAllUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call(UserEntity userEntity){
    return repository.getUsers(userEntity);
  }
}