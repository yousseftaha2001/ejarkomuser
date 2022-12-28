import 'dart:convert';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:ejarkom/app/login/models/login_result.dart';
import 'package:ejarkom/app/sign_up/models/phone_veri_model.dart';
import 'package:ejarkom/app/sign_up/models/signup_requets.dart';
import 'package:ejarkom/app/sign_up/models/whats_ver_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/local_error.dart';

class AuthManger {
    static Future<Either<String, String>> actionOnRequest(
      {required String id, required String api}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse('$api$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (jsonDecode(result)['status'] == true) {
          print(formattedResult);
          return const Right('Done');
        } else {
          return Left(formattedResult['msg']);
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      print(e.toString());
      return Left(
        e.toString(),
      );
    }
  }
  static Future<Either<LocalError, String>> postRequestHelper({
    required String api,
    Map<String, String>? data,
    var photo,
    var photo2,
    var photo1,
    var video,
    List<Uint8List>? photos,
  }) async {
    try {
      var token = MyDataBase.getToken();
      if (token.isNotEmpty) {
        var headers = {'Authorization': 'Bearer $token'};
        var request = http.MultipartRequest('POST', Uri.parse(api));
        request.headers.addAll(headers);
        if (data != null) {
          request.fields.addAll(data);
        }
        if (photo != null) {
          request.files.add(
            http.MultipartFile.fromBytes('photo', photo, filename: 'name.png'),
          );
        }
        if (photo1 != null) {
          request.files.add(
            http.MultipartFile.fromBytes('photo1', photo2,
                filename: 'name.png'),
          );
        }
        if (photo2 != null) {
          request.files.add(
            http.MultipartFile.fromBytes('photo2', photo2,
                filename: 'name.png'),
          );
        }
        if (photos != null) {
          print('h');
          for (int i = 0; i < photos.length; i++) {
            // File f=File(createAdModel.photos![i]);
            // Uint8List image= await f.readAsBytes();
            // print(photos.first);
            request.files.add(
              http.MultipartFile.fromBytes('photo${i + 1}', photos[i],
                  filename: 'name.png'),
            );
          }
          print('h2');
        }
        if (video != null) {
          request.files.add(
            http.MultipartFile.fromBytes('video', video, filename: 'name.png'),
          );
        }
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          var result = await response.stream.bytesToString();
          print(result);
          if (jsonDecode(result)['status']) {
            return const Right('Task added successfully.');
          } else {
            return Left(
                LocalError(error: jsonDecode(result)['msg'].toString()));
          }
        } else {
          // print(jsonDecode(result)['status']);
          print(response.statusCode.toString());
          return Left(LocalError(error: 'Some thing want wrong1'));
        }
      } else {
        return Left(LocalError(error: 'No tokne'));
      }
    } catch (e) {
      return Left(LocalError(error: e.toString()));
    }
  }

  static Future<Either<LocalError, dynamic>> getRequestHelper(
      {required String api}) async {
    try {
      var token = MyDataBase.getToken();
      if (token.isNotEmpty) {
        var headers = {'Authorization': 'Bearer $token'};
        var request = http.MultipartRequest('GET', Uri.parse(api));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          var result = await response.stream.bytesToString();

          var formattedResult = jsonDecode(result);
          if (formattedResult['status']) {
            print(formattedResult);
            return Right(formattedResult);
          } else {
            return Left(LocalError(error: formattedResult['msg']));
          }
        } else {
          // print(response.reasonPhrase);
          return Left(
            LocalError(
              error: response.reasonPhrase.toString(),
            ),
          );
        }
      } else {
        return Left(LocalError(error: 'No Token'));
      }
    } catch (e) {
      return left(
        LocalError(
          error: e.toString(),
          location: 'catch api services',
        ),
      );
    }
  }
  static Future<Either<String, dynamic>> postRequestHelperNoToken({
    required String api,
    required Map<String, String> data,
    var photo,
    var photo2,
    var photo3,
    var video,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(api));

      request.fields.addAll(data);
      if (photo != null) {
        request.files.add(
          http.MultipartFile.fromBytes('photo1', photo, filename: 'name.png'),
        );
      }
      if (photo2 != null) {
        request.files.add(
          http.MultipartFile.fromBytes('photo2', photo2, filename: 'name.png'),
        );
      }
      if (photo3 != null) {
        request.files.add(
          http.MultipartFile.fromBytes('photo3', photo3, filename: 'name.png'),
        );
      }
      if (video != null) {
        request.files.add(
          http.MultipartFile.fromBytes('video', video, filename: 'name.png'),
        );
      }
      print('1');
      http.StreamedResponse response = await request.send();
       print('2');
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        if (jsonDecode(result)['status']) {
          print(jsonDecode(result));
           print('3');
          return Right(jsonDecode(result));
        } else {
           print('4');
          return Left(jsonDecode(result)['msg'].toString());
        }
      } else {
        // print(jsonDecode(result)['status']);
         print('5');
        print(response.reasonPhrase.toString());
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
       print('6');
      print(e.toString());
      return Left(e.toString());
    }
  }
  static Future<Either<String, LoginResult>> login(
      {required String email,
      required String password,
      required String fire}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(loginAPI));
      request.fields.addAll(
        {
          'email': email,
          'pass': password,
          'fire': fire,
        },
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        print(formattedResult);
        if (formattedResult['status']) {
          return right(LoginResult.fromJson(result));
        } else {
          return Left(formattedResult['msg']);
        }
      } else {
        print(response.reasonPhrase);
        return left(response.reasonPhrase.toString());
      }
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  static Future<Either<String, LoginResult>> googlSignIn({
    required String email,
    required String name,
    required String fire,
    required String photo,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(googlaSignAPI));
      request.fields.addAll(
        {
          'email': email,
          'name': name,
          'fire': fire,
          'phone': '000',
          'photo': photo,
        },
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        print(formattedResult);
        if (formattedResult['status']) {
          if (formattedResult['msg'] == 'new') {
            return right(LoginResult(status: false));
          } else {
            return right(LoginResult.fromJson(result));
          }
        } else {
          return Left(formattedResult['msg']);
        }
      } else {
        print(response.reasonPhrase);
        return left(response.reasonPhrase.toString());
      }
    } catch (e) {
      print(e.toString());
      return left(e.toString());
    }
  }

  static Future<Either<String, int>> sendEmail({required String email}) async {
    try {
      var request = http.Request('GET', Uri.parse('$sentMailAPI$email'));
      // request.fields.addAll({'email': email});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        print(formattedResult);
        if (formattedResult['msg'] == 'ss') {
          return Right(formattedResult['num']);
        } else {
          return const Left('Some thing want wrong');
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }
  static Future<String> getGoogle() async {
    try {
      var request = http.Request('GET', Uri.parse(googleAPI));
      // request.fields.addAll({'email': email});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        return result.toString();
      } else {
        print(response.reasonPhrase);
        return response.reasonPhrase.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<Either<String, PhoneVeriModel>> sendSms(
      {required String phone}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(sendSmsAPI));
      // request.fields.addAll({'email': email});

      request.fields.addAll({'id': '+962$phone'});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        print(formattedResult);
        if (formattedResult['msg'] == 'ss') {
          return Right(PhoneVeriModel.fromJson(formattedResult));
        } else {
          return Left(formattedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }
  

  static Future<Either<String, WhatsVerModel>> sendWhats(
      {required String phone}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(sendWhatsAppAPI));
      // request.fields.addAll({'email': email});
      print(phone);

      request.fields.addAll({'id': '+962$phone'});

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        print(formattedResult);
        if (formattedResult['msg'] == 'ss') {
          return Right(WhatsVerModel.fromJson(formattedResult));
        } else {
          return Left(formattedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  static Future<Either<String, dynamic>> findUser({required String phone}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(findUserAPI));
      // request.fields.addAll({'email': email});

      // request.fields.addAll({'id': '+20$phone'});
      if (phone.isPhoneNumber) {
        request.fields.addAll({'id': '+962$phone'});
      } else {
        request.fields.addAll({'id': phone});
      }

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        print(formattedResult);
        if (formattedResult['status']) {
          return Right(formattedResult);
        } else {
          return Left(formattedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  static Future<Either<String, String>> forgetPassword(
      {required String pass, required String email}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(forgetAPi));
      request.fields.addAll({'email': email, 'password': pass});

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        print(jsonDecode(result));
        if (jsonDecode(result)['msg'] == 'Success') {
          return Right('Success');
        } else {
          return Left(jsonDecode(result)['msg']);
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, LoginResult>> signUp(
      {required SignUpRequestModel requestModel, required var photo}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(signUpAPI),
      );
      request.fields.addAll(requestModel.toMap());
      if (photo != null) {
        request.files.add(
          http.MultipartFile.fromBytes('photo1', photo, filename: 'name.png'),
        );
      }

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['token'] != null) {
          return Right(LoginResult.fromJson(result));
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        // print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

//
  static Future<Either<String, String>> logoutHTTP() async {
    try {
      var token = MyDataBase.getToken();
      if (token.isNotEmpty) {
        var headers = {'Authorization': 'Bearer $token'};
        var request = http.Request('POST', Uri.parse(logoutAPI));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          var result = await response.stream.bytesToString();
          print(jsonDecode(result));
          if (jsonDecode(result)['message'] == 'Logout successfuly') {
            return Right('Done');
          } else {
            return Left('Error');
          }
        } else {
          print(response.reasonPhrase);
          return Left('Error');
        }
      } else {
        return Left('Error');
      }
    } catch (e) {
      return Left('Error');
    }
  }
  static Future<Either<String, String>> logoutHTTPC() async {
    try {
      var token = MyDataBase.getToken();
      if (token.isNotEmpty) {
        var headers = {'Authorization': 'Bearer $token'};
        var request = http.Request('POST', Uri.parse(logoutCAPI));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          var result = await response.stream.bytesToString();
          print(jsonDecode(result));
          if (jsonDecode(result)['message'] == 'Logout successfuly') {
            return Right('Done');
          } else {
            return Left('Error');
          }
        } else {
          print(response.reasonPhrase);
          return Left('Error');
        }
      } else {
        return Left('Error');
      }
    } catch (e) {
      return Left('Error');
    }
  }

  static Future<Either<String, String>> deleteAccount(String id) async {
    try {
      var token = MyDataBase.getToken();
      if (token.isNotEmpty) {
        var headers = {'Authorization': 'Bearer $token'};
        var request = http.Request('GET', Uri.parse('$deleteMyData/$id'));

        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          var result = await response.stream.bytesToString();
          if (jsonDecode(result)['status']) {
            return Right('Done');
          } else {
            return Left('Error');
          }
        } else {
          print(response.reasonPhrase);
          return Left('Error');
        }
      } else {
        return Left('Error');
      }
    } catch (e) {
      return Left('Error');
    }
  }
}
