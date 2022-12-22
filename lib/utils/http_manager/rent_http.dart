import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ejarkom/app/complete_data/models/MyDataModel.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:http/http.dart' as http;

class RentHttp {
  Future<Either<String, String>> rentBuild({required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('POST', Uri.parse('$rentAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['msg'] == 'Success') {
          return Right('Done');
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

  Future<Either<String, String>> addInfo({
    required String address,
    required String dob,
    required var idPhoto,
    required var sigPhoto,
  }) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(addDataAPI));
      request.fields.addAll({
        'DOB': dob,
        'address': address,
      });
      print('3');
      request.files.add(
        http.MultipartFile.fromBytes('photo1', idPhoto, filename: 'photo1.png'),
      );
      print('h2');
      request.files.add(
        http.MultipartFile.fromBytes('photo2', sigPhoto,
            filename: 'photo2.png'),
      );
      print('h');

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print('object');

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        print('object2');
        var formattedResult = jsonDecode(result);
        print(result);
        if (formattedResult['status'] == true) {
          return Right(formattedResult['msg'].toString());
        } else {
          return Left(formattedResult['msg'].toString());
        }
      } else {
        // var error = await response.stream.toString();
        // print(response.headers.toString());
        print('object2');
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MyDataModel>> getMyData() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(myDataAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(MyDataModel.fromJson(formattedResult));
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
}
