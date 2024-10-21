// ignore_for_file: avoid_print
import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:jaspr_app_write_site/constants/app_write_constants.dart';

class AuthService {
  Client client = Client();
  Account? _account;

  AuthService() {
    client
        .setEndpoint(AppWriteConstants.projectEndPoint)
        .setProject(AppWriteConstants.projectID)
        .setSelfSigned(status: true);
    _account = Account(client);
  }

  Future<String> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account?.create(
          userId: ID.unique(), email: email, password: password);
      print('User created: $account');
      return "success";
    } on AppwriteException catch (e, st) {
      print('AppwriteException during signup: $e\n$st');
      return e.message ?? 'An unknown error occurred during sign-up.';
    }
  }

  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _account?.createEmailPasswordSession(
          email: email, password: password);
      print('Session created: ${session!.secret}');
      return 'success';
    } on AppwriteException catch (e, st) {
      print('AppwriteException during login: $e\n$st');
      return e.message ?? 'An unknown error occurred during login.';
    }
  }

  Future checkSessions() async {
    try {
      await _account?.getSession(sessionId: 'current');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _account?.deleteSession(sessionId: 'current');
      print('Logged out successfully');
    } on AppwriteException catch (e, st) {
      print('AppwriteException during logout: $e\n$st');
    }
  }
}
