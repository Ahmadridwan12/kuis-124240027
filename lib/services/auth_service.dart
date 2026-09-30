import '../core/app_config.dart';

class AuthService {
  /// Login berhasil jika username tidak kosong DAN password == NIM.
  static bool login(String username, String password) {
    return username.trim().isNotEmpty && password == kNim;
  }
}
