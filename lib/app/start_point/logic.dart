import 'package:ejarkom/utils/my_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../main.dart';
import 'state.dart';

class StartPointLogic extends GetxController {
  final StartPointState state = StartPointState();

  RxString token = ''.obs;
  RxString type = ''.obs;

  void notificationInit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      // print('Message data: ${message.data}');
      // print(message.notification!.title);
      //${message.notification!.title.toString()}
      Get.snackbar('Notification', '${message.notification!.title.toString()}',
          duration: Duration(seconds: 10), onTap: (GetSnackBar s) {
            // changeCurrentIndex(1);
          });

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   // If you're going to use other Firebase services in the background, such as Firestore,
  //   // make sure you call `initializeApp` before using other Firebase services.
  //
  //   print("Handling a background message: ${message.messageId}");
  //   // changeCurrentIndex(1);
  // }


  checkToken() async {
    // MyDataBase.removeDate();
    var result = MyDataBase.getToken();
    var result2 = MyDataBase.getType();
    printInfo(info: result);

    token.value = result;
    type.value = result2;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkToken();
    notificationInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  updateToken(String newToken) => token.value = newToken;
  updateType(String newToken) => type.value = newToken;
}
