import 'dart:convert';
import 'package:DozerOwner/constants/constants.dart';
import 'package:DozerOwner/core/errors/exceptions.dart';
import 'package:DozerOwner/features/owner_profile/data/models/user_model.dart';
import 'package:DozerOwner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> editUserProfile(UserEntity user);
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final http.MultipartRequest request;
  String uri = "https://dozer-backend-tech-gem.onrender.com/api/v1/renterProfile";
  UserRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences,required this.request});

  @override
  Future<UserModel> editUserProfile(UserEntity user) async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final userModel = user.toUserModel().toJson();
    request.headers['Authorization'] = "Bearer $token";

    userModel.forEach((key, value) async {
      if (value != null) {
        if (key != "profilePicture" && key != 'cv') {
          request.fields[key] = value.toString();
        } else {
          final file = await http.MultipartFile.fromPath(key, value);
          request.files.add(file);
        }
      }
    });

    final response = await request.send();
    final responseBody = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(responseBody.body)['value']);
    } else {
      throw ServerException(serverFaliure);
    }
  }

  @override
  Future<UserModel> getUser() async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final response = await client.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body)['value']);
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
