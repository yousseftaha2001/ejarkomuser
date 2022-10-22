import 'dart:convert';

import 'package:ejarkom/app/my_checks/models/CheckupsRequestModel.dart';
import 'package:ejarkom/app/requests/models/AllRequestsModel.dart';
import 'package:ejarkom/app/requests/models/requests/requests.dart';
import 'package:ejarkom/app/services/models/service_type_model/service_type_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../my_database.dart';

class RequestsHttp {
  Future<Either<String, Requests>> getWaitingAds({required String api}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(api));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        // print(formattedResult);
        if (jsonDecode(result)['status'] == true) {
          return Right(Requests.fromJson(result));
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

  Future<Either<String, CheckupsRequestModel>> getChecks() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(checksAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        // print(formattedResult);
        if (jsonDecode(result)['status'] == true) {
          return Right(CheckupsRequestModel.fromJson(formattedResult));
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

  Future<Either<String, String>> cancelRequest({required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('POST', Uri.parse('$cancelRequestAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['msg'] == 'Success') {
          return Right('done');
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
