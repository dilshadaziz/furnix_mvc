import 'package:furnix_store/services/user/firebase_user.service.dart';

import '../models/user_model.dart';

class UserRepository {
  final FirebaseUserService _userService = FirebaseUserService();

  Future<UserModel> fetchUser() async {
    return await _userService.getUser();
  }
}
