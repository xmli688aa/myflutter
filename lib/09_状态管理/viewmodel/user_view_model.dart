import 'package:flutter/foundation.dart';
import 'package:my_app/09_%E7%8A%B6%E6%80%81%E7%AE%A1%E7%90%86/model/model.dart';

class UserViewModel extends ChangeNotifier{
  UserInfo _user;
  UserViewModel(this._user);
  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}