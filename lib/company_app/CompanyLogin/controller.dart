import 'package:ejarkom/app/sign_up/models/signup_requets.dart';
import 'package:ejarkom/company_app/CompanyHome/view.dart';
import 'package:ejarkom/company_app/CompanyLogin/models/login_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/http_manager/auth_manager.dart';
import 'package:ejarkom/utils/method.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:ejarkom/utils/widgets/my_indicator_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'index.dart';

class CompanyloginController extends GetxController {
  CompanyloginController();
  final state=CompanyloginState();

 changePassState() => state.changePass.value = !state.changePass.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGo();
    getFireBaseToken();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> sendMail() async {
    // var result = collectData();
    if (state.email.text.isEmail && state.passwordF.text.length > 6) {
      changePassState();
      var mailResult =
          await AuthManger.sendEmail(email: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());

          mySnackBar(
              title: 'Error'.tr,
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString().tr);
        },
        (r) async {
          state.pinCode = r;
          // await Get.dialog(
          //   VerificationDialogLogin(),
          //   barrierDismissible: false,
          // );
        },
      );
      changePassState();
    } else {
      // Get.snackbar('Some thing want wrong'.tr, 'please complete your data'.tr);
      mySnackBar(
          title: 'Some thing want wrong'.tr,
          body: 'please complete your data'.tr);
    }
  }

  bool phoneEamilChecker() {
    if (state.selectedSendingOption.value == state.sendingOptions[2]) {
      return state.email.text.isEmail;
    } else {
      return state.email.text.isPhoneNumber;
    }
  }

  Future<void> sendWahts() async {
    // var result = collectData();
    if (phoneEamilChecker() && state.passwordF.text.length > 6) {
      changePassState();
      var mailResult =
          await AuthManger.sendWhats(phone: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());

          mySnackBar(
              title: 'Error'.tr,
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString().tr);
        },
        (r) async {
          state.pinCode = r.num!;
          // await Get.dialog(
          //   VerificationDialogLogin(),
          //   barrierDismissible: false,
          // );
        },
      );
      changePassState();
    } else {
      // Get.snackbar('Some thing want wrong'.tr, 'please complete your data'.tr);
      mySnackBar(
          title: 'Some thing want wrong'.tr,
          body: 'please complete your data'.tr);
    }
  }

  Future<void> sendPhone() async {
    // var result = collectData();
    if (phoneEamilChecker() && state.passwordF.text.length > 6) {
      changePassState();
      var mailResult = await AuthManger.sendSms(phone: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());

          mySnackBar(
              title: 'Error'.tr,
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString().tr);
        },
        (r) async {
          state.pinCode = r.num!;
          state.phoneVeriModel = r;
          state.timeIsOpen.value = true;
          // await Get.dialog(
          //   VerificationDialogLogin(),
          //   barrierDismissible: false,
          // );
        },
      );
      changePassState();
    } else {
      // Get.snackbar('Some thing want wrong'.tr, 'please complete your data'.tr);
      mySnackBar(
          title: 'Some thing want wrong'.tr,
          body: 'please complete your data'.tr);
    }
  }

  Future<void> resendPhone() async {
    // var result = collectData();
    if (phoneEamilChecker() && state.passwordF.text.length > 6) {
      changePassState();
      var mailResult = await AuthManger.sendSms(phone: state.email.text.trim());
      mailResult.fold(
        (l) {
          print(l.toString());

          mySnackBar(
              title: 'Error'.tr,
              body: l.toString() == ''
                  ? 'No Internet Connection'.tr
                  : l.toString().tr);
        },
        (r) async {
          state.pinCode = r.num!;
          state.phoneVeriModel = r;
          state.timeIsOpen.value = true;
          mySnackBar(title: 'Done'.tr, body: 'The Code Has Been Send'.tr);
          // await Get.dialog(
          //   VerificationDialogLogin(),
          //   barrierDismissible: false,
          // );
        },
      );
      changePassState();
    } else {
      // Get.snackbar('Some thing want wrong'.tr, 'please complete your data'.tr);
      mySnackBar(
          title: 'Some thing want wrong'.tr,
          body: 'please complete your data'.tr);
    }
  }

  Future<void> completeForger() async {
    changePassState();
    var signUpResult = await AuthManger.forgetPassword(
      email: state.email.text,
      pass: state.passwordF.text,
    );
    signUpResult.fold(
      (l) {
        // Get.snackbar('Error'.tr, l.toString());
        mySnackBar(title: 'Error'.tr, body: l.toString());
        changePassState();
      },
      (r) async {
        // await MyDataBase.insertToken(token: r.token!);

        changePassState();
        Get.back();
        // Get.snackbar('Done'.tr, 'Password has been changed'.tr);
        mySnackBar(title: 'Done'.tr, body: 'Password has been changed'.tr);
        // setData();

        // Get.back();
      },
    );
  }

  changeLoginState() => state.loginState.value = !state.loginState.value;

  void loginButton() async {
    if (state.email.text.isNotEmpty && state.password.text.isNotEmpty) {
      changeLoginState();
      var result = await AuthManger.postRequestHelperNoToken(
     api: loginCompanyAPI,
      data: {
        'email': state.email.text,
        'pass': state.password.text,
      },
      );
      result.fold(
        (l) {
          // Get.snackbar('Error'.tr, l.toString().tr);
          mySnackBar(title: 'Error'.tr, body: l.toString());
          changeLoginState();
        },
        (r) {
          LoginModel loginResultModel = LoginModel.fromJson(r);
          MyDataBase.insertData(
            token: loginResultModel.token!,
            type: '2',
            id: loginResultModel.user!.id!.toString(),
            pass: state.password.text,
            email: loginResultModel.user!.email!,
            name: loginResultModel.user!.name!,
            phone: loginResultModel.user!.phone!,
            photo: loginResultModel.user!.photo!,
          );
          changeLoginState();
          // print(loginResultModel);
          Get.offAll(() => CompanyhomePage());
        },
      );
    } else {
      // Get.snackbar('Error'.tr, 'please complete your data'.tr);
      mySnackBar(title: 'Error'.tr, body: 'please complete your data'.tr);
    }
  }

  void getFireBaseToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    print(token);
    if (token == null) {
      state.firebaseToken = '';
    } else {
      state.firebaseToken = token;
    }
    // state.firebaseToken = token!;
  }

  void changePass() async {
    Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
    var result = await AuthManger.findUser(phone: state.email.text);
    result.fold(
      (l) {
        Get.back();
        mySnackBar(title: 'Error'.tr, body: 'User Not Found'.tr);
      },
      (r) {
        Get.back();
        if (state.selectedSendingOption.value == state.sendingOptions[2]) {
          sendMail();
        } else if (state.selectedSendingOption.value ==
            state.sendingOptions[0]) {
          sendWahts();
        } else {
          //whats;
          sendPhone();
        }
      },
    );
  }
  void getGo() async {
    // Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
    var result = await AuthManger.getGoogle();
    state.googleI.value=result;
  }

  void nextButton() {
    // if (state.selectedSendingOption.value == state.sendingOptions[2]) {
    //   Get.back();
    //   Get.dialog(
    //     ForgetPasswordDialog(),
    //     barrierDismissible: false,
    //   );
    // }
    Get.back();
    // Get.dialog(
    //   ForgetPasswordDialog(),
    //   barrierDismissible: false,
    // );
  }

  void googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        // 'phone',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      var result = await _googleSignIn.signIn();
      if (result != null) {
        // print(result!.displayName!);
        // print(result.email);
        // print(result.photoUrl!);
        Get.dialog(
          MyIndicatorDialog(),
          barrierDismissible: false,
        );
        var result2 = await AuthManger.googlSignIn(
          email: result.email,
          name: result.displayName ?? '',
          fire: state.firebaseToken,
          photo: result.photoUrl ?? '',
        );
        state.fullname.text=result.displayName ?? '';
        state.emailS.text=result.email;
        result2.fold(
          (l) {
            Get.back();
            mySnackBar(title: 'Error'.tr, body: l.toString());
          },
          (r) {
            if (r.status!) {
              MyDataBase.insertData(
                token: r.token!,
                id: r.user!.id!.toString(),
                type: '2',
                pass: state.password.text,
                email: r.user!.email!,
                name: r.user!.name!,
                phone: r.user!.phone!,
                photo: r.user!.photo!,
              );
              Get.back();
              // Get.offAll(() => HomePage());
            } else {
              Get.back();
              // mySnackBar(title: 'New', body: 'body');
              // Get.dialog(PhoneDialog(),barrierDismissible: false);
            }
          },
        );
      }
      //  print('object');

      //  print(result!.!);
    } catch (error) {
      print(error);
    }
  }
  dynamic collectData() async {
    if (state.emailS.text.isEmail &&
      
        state.fullname.text.isNotEmpty &&
        state.phone2.text.isPhoneNumber &&
        
        state.firebaseToken.isNotEmpty) {
      // var firebaseToken = await FirebaseMessaging.instance.getToken();
      SignUpRequestModel signUpRequestModel = SignUpRequestModel(
        email: state.emailS.text.trim(),
        name: state.fullname.text.trim(),
        password: '00',
        tokenMassage: state.firebaseToken,
        phone: state.phone2.text,
      );
      return signUpRequestModel;
    } else {
      return '';
    }
  }
  void signUpLogic() async {
    var data = await collectData();
    if (data is SignUpRequestModel) {
      // changeSend();
      var requestResult =
          await AuthManger.signUp(requestModel: data, photo: null);
      requestResult.fold(
        (l) {
          if (kDebugMode) {
            print(l);
          }
          // changeSend();
          // Get.snackbar('Error'.tr, l.tr);
          mySnackBar(title: 'Error'.tr, body: l.tr);
        },
        (r) {
          // changeSend();
          MyDataBase.insertData(
            token: r.token!,
            id: r.user!.id!.toString(),
            type: '2',
            pass: '',
            email: r.user!.email!,
            name: r.user!.name!,
            phone: r.user!.phone!,
            photo: r.user!.photo!,
          );
          // homeController.checkUser();
          // Get.back();
          if (kDebugMode) {
            print(r.token);
            // print(MainPageController.getStorageServices.readUserD());
          }
          // state.tryToSignUp.value = false;
          // Get.offAll(() => HomePage());

          // clearData();
        },
      );
    } else {
      // Get.snackbar('Error'.tr, 'please complete the info'.tr);
      mySnackBar(title: 'Error'.tr, body: 'please complete the info'.tr);
    }
  }

  void nextPhone(){
    if (state.phone2.text.isPhoneNumber) {
      print("object");
      // Get.to(()=>LoginSteper());
    }
  }
  void stepThree() {
    if (state.selectedSendingOption2.value == state.sendingOptions2[0]) {
      if (state.phoneCode.text == state.whatsVerModel!.num.toString()) {
        print('Done');
        signUpLogic();
      } else {
        mySnackBar(title: 'Error', body: 'The Code is not Correct');
      }
    } else {
      if (state.phoneCode.text == state.phoneVeriModel!.num.toString()) {
        print('Done');
          signUpLogic();
      } else {
        mySnackBar(title: 'Error', body: 'The Code is not Correct');
      }
    }
  }

  void stepTwo() async {
    if (state.selectedSendingOption2.value.isNotEmpty) {
      if (state.selectedSendingOption2.value == state.sendingOptions2[0]) {
         Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
          var phoneSending =
              await AuthManger.sendWhats(phone: state.phone2.text.trim());
          phoneSending.fold(
            (l) {
              mySnackBar(title: 'Error'.tr, body: l.toString());
              Get.back();
            },
            (r) {
              state.whatsVerModel = r;
              print(state.whatsVerModel!.num);
              Get.back();
              state.currentStep.value = state.currentStep.value + 1;
            },
          );
      } else {
       if (state.phoneVeriModel!=null) {
          if (!state.timeIsOpen.value) {
          Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
          var phoneSending =
              await AuthManger.sendSms(phone: state.phone2.text.trim());
          phoneSending.fold(
            (l) {
              mySnackBar(title: 'Error'.tr, body: l.toString());
              Get.back();
            },
            (r) {
              state.phoneVeriModel = r;
              print(state.phoneVeriModel!.tryAgain!.minute-DateTime.now().minute);
              state.timeIsOpen.value=true;
              Get.back();
              state.currentStep.value = state.currentStep.value + 1;
            },
          );
        } else {
          mySnackBar(
              title: 'Error'.tr,
              body:
                  'Pleas await until ${dateParser(state.phoneVeriModel!.tryAgain!.toString())}');
        }
       }else{
         Get.dialog(MyIndicatorDialog(), barrierDismissible: false);
          var phoneSending =
              await AuthManger.sendSms(phone: state.phone2.text.trim());
          phoneSending.fold(
            (l) {
              mySnackBar(title: 'Error'.tr, body: l.toString());
              Get.back();
            },
            (r) {
              state.phoneVeriModel = r;
              print(state.phoneVeriModel!.tryAgain);
              Get.back();
              state.currentStep.value = state.currentStep.value + 1;
            },
          );
       }
      }
    }
  }
  String nextButtonText(){
    if (state.currentStep.value==0) {
      return 'Next'.tr;
    }else if(state.currentStep.value==1){
      if (state.phoneVeriModel==null||state.selectedSendingOption2.value==state.sendingOptions2[0]) {
        return 'Send'.tr;
      }else{
        return 'resend';
      }
    }else{
      return 'Next'.tr;
    }
  }
}
