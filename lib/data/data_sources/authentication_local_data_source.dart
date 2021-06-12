import 'package:hive/hive.dart';

const String AUTH_BOX = 'authBox';
const String SESSION_KEY = 'session_id';

abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
  String getSessionId();
  Future<void> deleteSessionId();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  @override
  Future<void> saveSessionId(String sessionId) async {
    final authBox = Hive.box(AUTH_BOX);
    return await authBox.put(SESSION_KEY, sessionId);
  }

  @override
  String getSessionId() {
    final authBox = Hive.box(AUTH_BOX);
    return authBox.get(SESSION_KEY);
  }

  @override
  Future<void> deleteSessionId() async {
    final authBox = Hive.box(AUTH_BOX);
    return await authBox.delete(SESSION_KEY);
  }

}