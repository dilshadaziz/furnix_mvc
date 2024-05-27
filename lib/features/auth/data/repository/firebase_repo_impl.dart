import 'package:furnix_store/features/auth/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:furnix_store/features/auth/domain/entities/user/user_entity.dart';
import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});


  @override
  Future<void> createUser(UserEntity user) async => remoteDataSource.createUser(user);

  @override
  Stream<List<UserEntity>> getSingletUser(String uid) => remoteDataSource.getSingletUser(uid);

  @override
  Future<String> getCurrentUid() async => remoteDataSource.getCurrentUid();

  @override
  Stream<List<UserEntity>> getUsers(UserEntity user) => remoteDataSource.getUsers(user);
  @override
  Future<bool> isSignedIn() async => remoteDataSource.isSignedIn();

  @override
  Future<void> signInWithEmailAndPassword(UserEntity user) async => remoteDataSource.signInWithEmailAndPassword(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Future<void> signUpWithEmailAndPassword(UserEntity user) async => remoteDataSource.signUpWithEmailAndPassword(user);

  @override
  Future<void> updateUser(UserEntity user) async => remoteDataSource.updateUser(user);

}