import 'package:ejarkom/app/profile/models/ProfileModel.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dartz/dartz.dart';
class ProfileHttp{
  Future<Either<String, ProfileModel>> getProfile() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(profileAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(ProfileModel.fromJson(formattedResult));
        } else {
          return formattedResult['msg'];
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
}