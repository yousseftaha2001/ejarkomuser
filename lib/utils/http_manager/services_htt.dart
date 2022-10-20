import 'dart:convert';


import 'package:ejarkom/app/services/models/ServiceViewModel.dart';
import 'package:ejarkom/app/services/models/my_ser_model/my_ser_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../app/services/models/services_pandles_ads_model/services_pandles_ads_model.dart';

class ServicesHttp {
  Future<Either<String, String>> cancelServices({required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse('$myCanceledServices$id'));

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
  Future<Either<String, ServiceViewModel>> getService(
      {required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse('$viewOneServicesAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['msg'] == 'succsess') {
          return Right(ServiceViewModel.fromJson(formattedResult));
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

  Future<Either<String, ServicesPandlesAdsModel>> getServicePandels() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(getAllServicesADSAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        // print(formattedResult);
        if (jsonDecode(result)['msg'] == 'succsess') {
          return Right(ServicesPandlesAdsModel.fromJson(result));
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

  Future<Either<String, MySerModel>> getServices({required String api}) async {
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
        if (jsonDecode(result)['msg'] == 'succsess') {
          return Right(MySerModel.fromJson(result));
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

  Future<Either<String, String>> createAd({
    required String nameE,
    required String nameA,
    required String descriptionE,
    required String descriptionA,
    required String zoneId,
    required String typeSer,
    required String pandleID,
    required String whats,
    required String phone,
    required List photos,
  }) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(createServiceAPI));
      request.fields.addAll({
        'name_A': nameA,
        'name_E': nameE,
        'desc_E': descriptionE,
        'desc_A': descriptionA,
        'zone_id': zoneId,
        'type_serves': typeSer,
        'pandle_id': pandleID,
        'whats': whats,
        'phone': phone,
      });
      for (int i = 0; i < photos.length; i++) {
        print(photos[i]);
        request.files.add(
          http.MultipartFile.fromBytes('photo${i + 1}', photos[i],
              filename: 'name.png'),
        );
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(formattedResult['msg'].toString());
        } else {
          return Left(formattedResult['msg'].toString());
        }
      } else {
        var error = await response.stream.toString();
        print(response.headers.toString());
        return Left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
