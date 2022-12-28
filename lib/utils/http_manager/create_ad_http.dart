import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ejarkom/app/Ads/models/CreateAdModel.dart';
import 'package:ejarkom/app/Ads/models/GetBuildTypeModel.dart';
import 'package:ejarkom/app/Ads/models/GetCityModel.dart';
import 'package:ejarkom/app/Ads/models/GetZoneModel.dart';
import 'package:ejarkom/app/Ads/models/MyAdsRequestsModel.dart';
import 'package:ejarkom/app/Ads/models/all_ads_request/all_ads_request.dart';
import 'package:ejarkom/app/BuildsRequest/models/ManagementsRequestsAll.dart';
import 'package:ejarkom/app/BuildsRequest/models/manage_req_model.dart';
import 'package:ejarkom/utils/apis.dart';
import 'package:ejarkom/utils/my_database.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class CreateAdHttp {
  Future<Either<String, GetCityModel>> getAllCities() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(getCityAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(GetCityModel.fromJson(formattedResult));
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

  Future<Either<String, ManagementsRequestsAll>>
      getAllManagementRequests() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(manageBuildRequestAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(ManagementsRequestsAll.fromJson(formattedResult));
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

  Future<Either<String, GetBuildTypeModel>> getAllBuildTypes() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(getBuildTypesAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(GetBuildTypeModel.fromJson(formattedResult));
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

  Future<Either<String, GetZoneModel>> getAllZones({required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse('$getZonesAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['status'] == true) {
          return Right(GetZoneModel.fromJson(formattedResult));
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

  Future<Either<String, String>> cancelAD({required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('POST', Uri.parse('$cancelADAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['msg'] == 'Success') {
          return Right('done');
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

  Future<Either<String, String>> checkRequest({required String userId}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('POST', Uri.parse('$checkRequestAPI$userId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (formattedResult['msg'] == 'Success') {
          return Right('done');
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

  Future<Either<String, String>> createAd(
      {required CreateAdModel createAdModel, required List photos}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(createAdAPI));
      request.fields.addAll(createAdModel.toJson());
      for (int i = 0; i < photos.length; i++) {
        // File f=File(createAdModel.photos![i]);
        // Uint8List image= await f.readAsBytes();
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
        print(result);
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

  Future<Either<String, String>> createManagementRequest(
      {required ManageRequestModel createAdModel, required List photos}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.MultipartRequest('POST', Uri.parse(manageBuildAPI));
      request.fields.addAll(createAdModel.toJson());
      for (int i = 0; i < photos.length; i++) {
        // File f=File(createAdModel.photos![i]);
        // Uint8List image= await f.readAsBytes();
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

  Future<Either<String, AllAdsRequest>> getWaitingAds(
      {required String api}) async {
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
          return Right(AllAdsRequest.fromJson(result));
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

  Future<Either<String, MyAdsRequestsModel>> getRequests(
      {required String id}) async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse('$viewMyAdsRequestsAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formattedResult = jsonDecode(result);
        if (jsonDecode(result)['status'] == true) {
          return Right(MyAdsRequestsModel.fromJson(formattedResult));
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

  Future<Either<String, String>> actionOnRequest(
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
}
