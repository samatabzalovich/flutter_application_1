import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserProvider = ChangeNotifierProvider.autoDispose<UserProvider>(
  (ref) => UserProvider(),
);

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    uid: '',
    name: '',
    isOnline: true,
    phoneNumber: '',
    profilePic: '',
    groupId: [],
    token: '',
  );

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
