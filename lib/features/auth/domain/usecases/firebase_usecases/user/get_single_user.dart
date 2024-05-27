import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';
import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class GetSingleUserUseCase {
  final FirebaseRepository repository;

  GetSingleUserUseCase({required this.repository});
  
  Stream<List<UserEntity>> call(String uid){
    return repository.getSingletUser(uid);
  }

}