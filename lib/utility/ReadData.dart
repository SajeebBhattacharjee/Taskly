import 'package:shared_preferences/shared_preferences.dart';
Future<String?> ReadUserData(Key) async {
  final prefs = await SharedPreferences.getInstance();
 String? mydata = await prefs.getString(Key);
 return mydata;
}