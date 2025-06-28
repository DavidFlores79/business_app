import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class TokenStorageService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class TokenStorageServiceImpl implements TokenStorageService {
  final _storage = const FlutterSecureStorage();
  final _key = 'auth_token';

  @override
  Future<void> saveToken(String token) =>
      _storage.write(key: _key, value: token);

  @override
  Future<String?> getToken() => _storage.read(key: _key);

  @override
  Future<void> deleteToken() => _storage.delete(key: _key);
}
