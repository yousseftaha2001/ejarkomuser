import 'package:get_storage/get_storage.dart';

class MyDataBase {
  static final box = GetStorage();

  static Future<void> insertData({
    required String token,
    required String type,
    required String pass,
    required String id,
    required String name,
    required String email,
    required String phone,
    required String photo,
  }) async {
    await box.write('token', token);
    await box.write('type', type);
    await box.write('pass', pass);
    await box.write('id', id);
    await box.write('name', name);
    await box.write('email', email);
    await box.write('phone', phone);
    await box.write('photo', photo);
  }

  static void removeDate() async {
    await box.remove('token');
    await box.remove('type');
    await box.remove('pass');
    await box.remove('id');
    await box.remove('name');
    await box.remove('email');
    await box.remove('phone');
    await box.remove('photo');
  }

  static void updatePassword(String newPass) {
    box.write('pass', newPass);
  }

  static String getToken() => box.read('token') ?? '';
  static String getType() => box.read('type') ?? '';

  static String getPassword() => box.read('pass') ?? '';

  static String getId() => box.read('id') ?? '';
  static String getName() => box.read('name') ?? '';
  static String getEmail() => box.read('email') ?? '';
  static String getPhone() => box.read('phone') ?? '';
  static String getPhoto() => box.read('photo') ?? '';
}
