import 'package:dio/dio.dart';
import 'package:elm_task/core/error/exceptions.dart';

import '../../export.dart';

const url = 'https://ba4caf56-6e45-4662-bbfb-20878b8cd42e.mock.pstmn.io';

abstract class NetworkInterface {
  Future<Response> get(String endPoint, dynamic body);
  Future<Response> post(String endPoint, dynamic body);
  Future<Response> put(String endPoint, dynamic body);
  Future<Response> delete(String endPoint, dynamic body);
}

class Network implements NetworkInterface {
  final Dio dio;
  final LocalDataSource box;
  Network({
    required this.dio,
    required this.box,
  });

  late Map<String, String?> headers;

  Future<Response> _req(Future<Response> Function() requestType) async {
    headers = {
      'Content-Type': 'application/json',
      'Accept-Language':
          (await box.containsKey(kLanguage) ? await box.read(kLanguage) : 'ar'),
    };
    if (await box.containsKey(kToken)) {
      headers = {
        ...headers,
        'Authorization': 'Bearer ${await box.read(kToken)}',
      };
    }
    try {
      final response = await requestType();
      if (response.statusCode! > 210 || response.statusCode! < 200) {
        // Logger().i(response.data);
        throw response.data;
      }
      // success
      return response;
    } on DioException catch (e) {
      // Logger().i(e.message);
      throw ServerException(message: e.message);
    } catch (e) {
      // Logger().i(e);
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<Response> post(String endPoint, dynamic body) async {
    return _req(() {
      return dio.post(url + endPoint,
          data: body, options: Options(headers: headers));
    });
  }

  @override
  Future<Response> put(
    String endPoint,
    dynamic body,
  ) {
    return _req(() {
      return dio.put(url + endPoint,
          data: body, options: Options(headers: headers));
    });
  }

  @override
  Future<Response> delete(
    String endPoint,
    dynamic body,
  ) {
    return _req(() {
      return dio.delete(url + endPoint,
          data: body, options: Options(headers: headers));
    });
  }

  @override
  Future<Response> get(String endPoint, dynamic body, {String? baseUrl}) {
    return _req(() {
      return dio.get((baseUrl ?? url) + endPoint,
          options: Options(headers: headers));
    });
  }
}
