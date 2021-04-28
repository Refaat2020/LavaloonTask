import 'package:flutter_secure_storage/flutter_secure_storage.dart';

 getToken(String key) async {
  final storage = new FlutterSecureStorage();

  String value = await storage.read(key: key);

  print("$value apitoken");
  return value;
  }

