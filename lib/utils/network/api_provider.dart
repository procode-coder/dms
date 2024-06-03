import 'dart:async';
import 'dart:convert';

import 'package:dms/utils/network/custom_exception.dart';
import 'package:dms/utils/network/log.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> getData({
    required String subUrl,
    required String baseUrl,
    Map<String, dynamic>? body,
  }) async {
    var headers = <String, String>{};
    // headers["Content-Type"] = "application/json";
    // headers["Authorization"] = "";

    try {
      dynamic responseJson;

      final response = await http.get(
        Uri.parse("$baseUrl$subUrl"),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseJson = _response(response);

        if (responseJson == null) return null;
        return responseJson;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      Log.error("ApiProvider get  failed with timeout");
      return null;
    } catch (e) {
      Log.error("ApiProvider get failed with error $e");
      return null;
    }
  }

  Future<dynamic> putData({
    required String subUrl,
    required String baseUrl,
    Map<String, dynamic>? body,
  }) async {
    var headers = <String, String>{};
    // headers["Content-Type"] = "application/json";
    // headers["Authorization"] = "";

    try {
      dynamic responseJson;

      final response = await http.put(
        Uri.parse("$baseUrl$subUrl"),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseJson = _response(response);

        if (responseJson == null) return null;
        return responseJson;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      Log.error("ApiProvider put failed with timeout");
      return null;
    } catch (e) {
      Log.error("ApiProvider put failed with error $e");
      return null;
    }
  }

  Future<dynamic> postData({
    required String subUrl,
    required String baseUrl,
    Map<String, dynamic>? body,
  }) async {
    var headers = <String, String>{};
    // headers["Content-Type"] = "application/json";
    // headers["Authorization"] = "";

    try {
      dynamic responseJson;

      final response = await http.post(
        Uri.parse("$baseUrl$subUrl"),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseJson = _response(response);

        if (responseJson == null) return null;
        return responseJson;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      Log.error("ApiProvider get  failed with timeout");
      return null;
    } catch (e) {
      Log.error("ApiProvider get failed with error $e");
      return null;
    }
  }

  Future<dynamic> deleteData({
    required String subUrl,
    required String baseUrl,
    Map<String, dynamic>? body,
  }) async {
    var headers = <String, String>{};
    // headers["Content-Type"] = "application/json";
    // headers["Authorization"] = "";

    try {
      dynamic responseJson;

      final response = await http.delete(
        Uri.parse("$baseUrl$subUrl"),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        responseJson = _response(response);

        if (responseJson == null) return null;
        return responseJson;
      } else {
        Log.error(
            "ApiProvider delete failed with status code ${response.statusCode}");
        return null;
      }
    } on TimeoutException catch (_) {
      Log.error("ApiProvider delete failed with timeout");
      return null;
    } catch (e) {
      Log.error("ApiProvider delete failed with error $e");
      return null;
    }
  }

  dynamic response(http.Response response) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        Log.error(response.body.toString());
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        Log.error(response.body.toString());
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        Log.error(response.body.toString());
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
