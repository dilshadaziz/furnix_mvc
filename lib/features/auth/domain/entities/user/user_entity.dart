import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String fullName;
  final String email;
  final String location;
  final String profileUrl;

  // will not going to store in DB
  final String? password;
  final String? otherUid;

  const UserEntity({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.location,
    required this.profileUrl,
    required this.password,
    required this.otherUid,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        uid,
        fullName,
        email,
        location,
        profileUrl,
        password,
        otherUid,
      ];
}
