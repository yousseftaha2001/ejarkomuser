import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ejarkom/app/login/models/login_result.dart';
import 'package:ejarkom/app/sign_up/models/signup_requets.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';

import 'package:http/http.dart' as http;

class AuthManger {
  static Future<Either<String, LoginResult>> login(
      {required String email, required String password}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(loginAPI));
      request.fields.addAll(
        {
          'email': email,
          'pass': password,
          'fire': 'fire',
        },
      );

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
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

  static Future<Either<String, LoginResult>> signUp(
      {required SignUpRequestModel requestModel}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(signUpAPI),
      );
      request.fields.addAll(requestModel.toMap());

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
}
