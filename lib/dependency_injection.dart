// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:furnix_store/features/auth/data/data_sources/remote_data_source/remote_data_source.dart';
// import 'package:furnix_store/features/auth/data/data_sources/remote_data_source/remote_data_source_impl.dart';
// import 'package:furnix_store/features/auth/data/repository/firebase_repo_impl.dart';
// import 'package:furnix_store/features/auth/domain/repositories/firebase_repo.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/create_user.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/get_current_uid.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/get_single_user.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/get_users.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/is_sign_in_user.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/sign_in_with_email_and_password.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/sign_out.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/sign_up_with_email_and_password.dart';
// import 'package:furnix_store/features/auth/domain/usecases/firebase_usecases/user/update_user.dart';
// import 'package:get_it/get_it.dart';

// // final locate = GetIt.instance;

// Future<void> init() async {
//   // Use Cases

//   locate.registerLazySingleton<SignOutUseCase>(
//     () => SignOutUseCase(
//       repository: locate.call(),
//     ), );

//   locate.registerLazySingleton<IsSignedInUseCase>(
//     () => IsSignedInUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<GetCurrentUidUseCase>(
//     () => GetCurrentUidUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(
//     () => SignInWithEmailAndPasswordUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<SignUpwithEmailAndPasswordUseCase>(
//     () => SignUpwithEmailAndPasswordUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<GetAllUsersUseCase>(
//     () => GetAllUsersUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<CreateUserUseCase>(
//     () => CreateUserUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<GetSingleUserUseCase>(
//     () => GetSingleUserUseCase(
//       repository: locate.call(),
//     ),
//   );

//   locate.registerLazySingleton<UpdateUserUseCase>(
//     () => UpdateUserUseCase(
//       repository: locate.call(),
//     ),
//   );

//   // Repository

//   locate.registerLazySingleton<FirebaseRepository>(
//       () => FirebaseRepositoryImpl(remoteDataSource: locate.call(),),);

//   // // Remote Data Source
//   // locate.registerLazySingleton<FirebaseRemoteDataSource>(() =>
//   //     FirebaseRemoteDataSourceImpl(
//   //         firebaseFirestore: locate.call(), firebaseAuth: locate.call(),),);

//   // Externals
//   final firebaseFirestore = FirebaseFirestore.instance;
//   final firebaseAuth = FirebaseAuth.instance;

//   locate.registerLazySingleton(() => firebaseFirestore);
//   locate.registerLazySingleton(() => firebaseAuth);
// }
