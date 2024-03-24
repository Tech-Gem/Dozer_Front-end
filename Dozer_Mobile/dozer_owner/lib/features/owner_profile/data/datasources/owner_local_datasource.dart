import 'dart:convert';
import 'package:DozerOwner/constants/constants.dart';
import 'package:DozerOwner/core/errors/exceptions.dart';
import 'package:DozerOwner/features/owner_profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUser();
  Future<void> cacheUser(UserModel user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getUser() {
    final jsonString = sharedPreferences.getString(cachedUser);

    if (jsonString != null) {
      final json = jsonDecode(jsonString);
      final user = UserModel.fromJson(json);
      return Future.value(user);
    } else {
      throw CacheException(cacheException);
    }
  }

  @override
  Future<void> cacheUser(UserModel user) {
    final encodedUser = jsonEncode(user.toJson());
    return sharedPreferences.setString(cachedUser, encodedUser);
  }
}
