import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/user_model.dart';
import 'package:furnix_store/utils/constants/toasts.dart';
import 'package:image_picker/image_picker.dart';
import '../../repositories/user_repository.dart';

part 'user.event.dart';
part 'user.state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUser> (_onFetchUser);
    on<GetImageRequested>(_onGetImageRequested);
    on<EditProfileRequested>(_onEditProfileRequested);
  }

  Future<void> _onGetImageRequested(
      GetImageRequested event, Emitter<UserState> emit) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      print('picked image $pickedFile');
      if (pickedFile != null) {
        emit(UserLoading()); // Indicate loading state while uploading
        final url = await uploadImage(pickedFile);
        print('uploaded $url');
        await userRepository.addProfileImage(profileImageUrl: url, userId: _auth.currentUser!.uid);
        final user = await userRepository.fetchUser(userId: _auth.currentUser!.uid);
        emit(UserLoaded(user: user)); // Update user state with new URL
      } else {
        toast('Image not selected');
      }
    } catch (error) {
      emit(UserError(message: 'Error fetching image: $error'));
    }
  }

  Future<String> uploadImage(XFile imageFile) async {
    final user = _auth.currentUser!;
    final reference = _storage.ref().child('user_profiles/${user.uid}');
    final uploadTask = reference.putFile(File(imageFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

Future<void> _onEditProfileRequested(EditProfileRequested event, Emitter<UserState> emit) async {
  emit(EditProfileLoading());
  try {
    await userRepository.editProfile(user: event.user);
    // Emit success state (optional)
    final user = await userRepository.fetchUser(userId: _auth.currentUser!.uid);
    emit(EditProfileSuccess());
    emit(UserLoaded(user: user));
  } on Exception catch (e) {
    // Handle exceptions generically
    print('Error updating profile: $e');
    emit(UserError(message: e.toString())); // Emit error state
  }
}

Future<void> _onFetchUser(FetchUser event, Emitter<UserState> emit) async {
  try {
    final UserModel user = await userRepository.fetchUser(userId: _auth.currentUser!.uid);
    emit(UserLoaded(user: user));
  } on Exception catch (e) {
    // Handle exceptions generically
    print('Error fetching user: $e');
    emit(UserError(message: e.toString())); // Emit error state
  }
}

}
