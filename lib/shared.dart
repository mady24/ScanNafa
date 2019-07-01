import 'package:shared_preferences/shared_preferences.dart';
abstract class Shared{
  Future<String> save(String cle, String value);
  Future<String> read(String cle);
}

class _Shared implements Shared{

  Future<String> read(cle) async {
        final prefs = await SharedPreferences.getInstance();
        final key = cle;
        final scanned= prefs.getString(key) ?? 0;
        print('read: $scanned');
        return scanned;
      }

  Future<String> save(cle, value) async {
        final prefs = await SharedPreferences.getInstance();
        final key = cle;
        //final scanned = 42;
        prefs.setString(key, value);
        print('saved $key $value');
      }
}
