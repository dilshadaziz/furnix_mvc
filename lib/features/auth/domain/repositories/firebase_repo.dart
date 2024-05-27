import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';

abstract class FirebaseRepository {

  // Credentials
  // Future<void> signInUser(UserEntity user);
  Future<void> signInWithEmailAndPassword(UserEntity user);
  Future<void> signUpWithEmailAndPassword(UserEntity user);
  // Future<void> signUpwithGoogle(UserEntity user);
  // Future<void> signUpwithFacebook(UserEntity user);
  // Future<void> signUpwithApple(UserEntity user);
  // Future<void> signInWithGoogle(UserEntity user);
  // Future<void> signInWithFacebook(UserEntity user);
  // Future<void> signInWithApple(UserEntity user);

  Future<bool> isSignedIn();
  Future<void> signOut();


    // User
    Stream<List<UserEntity>> getUsers(UserEntity user);
    Stream<List<UserEntity>> getSingletUser(String uid);
    Future<String> getCurrentUid();
    Future<void> createUser(UserEntity user);
    Future<void> updateUser(UserEntity user);

}