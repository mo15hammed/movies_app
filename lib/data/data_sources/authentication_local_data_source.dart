import 'package:hive/hive.dart';

const String AUTH_BOX = 'authBox';
const String SESSION_KEY = 'session_id';

abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
  Future<String> getSessionId();
  Future<void> deleteSessionId();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    final authBox = await Hive.openBox(AUTH_BOX);
    return await authBox.put(SESSION_KEY, sessionId);
  }

  @override
  Future<String> getSessionId() async {
    final authBox = await Hive.openBox(AUTH_BOX);
    return authBox.get(SESSION_KEY);
  }

  @override
  Future<void> deleteSessionId() async {
    final authBox = await Hive.openBox(AUTH_BOX);
    authBox.delete(SESSION_KEY);
  }

}