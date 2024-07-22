import 'dart:convert';
import 'package:cripstv_academy/logic/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Manages session of Logged in user
class SessionManager {
  static late SharedPreferences sharedPreferences;

  ///Singleton pattern Impl
  SessionManager._internal();
  static final SessionManager _instance = SessionManager._internal();
  static SessionManager get instance => _instance;

  ///Prepares sharedPreference for use.
  ///init in main.dart
  ///
  Future<void> init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static const String authTokenKey = "token";
  static const String userKey = "user";
  static const String emailKey = "email-key";

  static const String userIdKey = "user-id";
  static const String currentRedirectKey = "";

  set authToken(value) => setToken(value);
  set user(User? value) => setUser(value!);
  set userId(String? value) => setUserId(value!);

  bool get userLoggedIn => user != null && authToken != null;

  Future setToken(String token) async =>
      await sharedPreferences.setString(authTokenKey, token);

  Future setUserId(String userId) async =>
      await sharedPreferences.setString(userIdKey, userId);

  Future setEmail(String email) async =>
      await sharedPreferences.setString(emailKey, email);

  Future setUser(User user) async {
    await sharedPreferences.setString(userKey, jsonEncode(user.toJson()));
    await setUserId(user.id!);
  }

  Future<void> setRedirect(String redirect) async {
    await sharedPreferences.setString(currentRedirectKey, redirect);
  }

  Future<void> clearRedirect() async {
    await sharedPreferences.setString(currentRedirectKey, "");
  }

  String? get authToken => sharedPreferences.getString(authTokenKey);

  String? get userId => sharedPreferences.getString(userIdKey);

  String? get email => sharedPreferences.getString(emailKey);

  User? get user {
    String? jsonString = sharedPreferences.getString(userKey);
    if (jsonString == null) return null;
    return User.fromJson(jsonDecode(jsonString));
  }

  String? get currentRedirect {
    String? value = sharedPreferences.getString(currentRedirectKey);
    if ((value ?? "").isEmpty) return null;
    return value;
  }

  Future<bool> setLoginData(String token, User user) async {
    await Future.wait([setToken(token), setUser(user)]);
    return true;
  }

  Future<bool> setTokenData(String token) async {
    await Future.wait([setToken(token)]);
    return true;
  }

  Future<bool> setUserIdData(String userId) async {
    await Future.wait([setToken(userId)]);
    return true;
  }

  Future<bool> setUserData(User user) async {
    await Future.wait([setUser(user)]);
    return true;
  }

  Future<void> closeSession() async => await sharedPreferences.clear();
}
