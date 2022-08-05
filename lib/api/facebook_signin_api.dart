import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInApi {
  static final _fbAuth = FacebookAuth.instance;

  static Future<LoginResult> login() => _fbAuth.login();

  static Future getUserData() => _fbAuth.getUserData();
}
