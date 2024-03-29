// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;
  final List<String> groupId;
  String? token;
  UserModel({
    required this.name,
    required this.uid,
    required this.profilePic,
    required this.isOnline,
    required this.phoneNumber,
    required this.groupId,
    this.token
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'uid': uid,
  //     'profilePic': profilePic,
  //     'isOnline': isOnline,
  //     'phoneNumber': phoneNumber,
  //     'groupId': groupId,
  //   };
  // }

  // factory UserModel.fromMap(Map<String, dynamic> map) {
  //   return UserModel(
  //     name: map['name'] ?? '',
  //     uid: map['uid'] ?? '',
  //     profilePic: map['profilePic'] ?? '',
  //     isOnline: map['isOnline'] ?? false,
  //     phoneNumber: map['phoneNumber'] ?? '',
  //     groupId: List<String>.from(map['groupId']),
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      'groupId': groupId,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      profilePic: map['profilePic'] as String,
      isOnline: map['isOnline'] as bool,
      phoneNumber: map['phoneNumber'] as String,
      groupId: List<String>.from((map['groupId'] as List<String>)),
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
