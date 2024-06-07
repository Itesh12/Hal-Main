import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// import '../../util/services/shared_preferences.dart';
import '../../util/services/shared_preferences.dart';
import 'api_response.dart';
import 'app_exception.dart';
import 'interceptor/dio_connectivity_request_retrier.dart';
import 'interceptor/retry_interceptor.dart';

enum ContentType { urlEncoded, json, multipart }

final apiProvider = Provider<ApiProvider>(
  (ref) => ApiProvider(ref),
);

class ApiProvider {
  ApiProvider(this.ref) {
    _dio = Dio();
    _dio.options.sendTimeout = 30000;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 30000;
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    _dio.httpClientAdapter = DefaultHttpClientAdapter();

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }

    _baseUrl = "https://api.daybestgroup.com";

    _baseUrl = "http://3.110.212.207:5000";

    // _baseUrl = "http://192.168.29.100:5000";

    // _baseUrl =
    //     "http://testingkisaanstation-env.eba-uezt4kgq.ap-south-1.elasticbeanstalk.com";
  }

  final Ref ref;

  late Dio _dio;

  late String _baseUrl;

  Future<APIResponse> post(
    String path, {
    dynamic body,
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.urlEncoded,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = _baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.multipart) {
      content = 'multipart/form-data';
    } else if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = UserPreferences.authToken;

    if (_appToken.isNotEmpty) {
      headers['Authorization'] = _appToken;
    }
    //Sometime for some specific endpoint it may require to use different Token
    if (token != null) {
      headers['Authorization'] = token;
    }

    try {
      final response = await _dio.post(
        url,
        data: body ?? {},
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        if (response.data['data'] != null) {
          return APIResponse.success(response.data['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data != null) {
            if (response.data.runtimeType == String) {
              return APIResponse.error(
                  AppException.errorWithMessage(response.data));
            } else if (response.data['message'] != null) {
              return APIResponse.error(AppException.errorWithMessage(
                  response.data['message'] ?? ''));
            } else {
              return const APIResponse.error(AppException.error());
            }
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
              AppException.errorWithMessage(e.response!.data['message']));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      debugPrint(e.stackTrace.toString());
      return const APIResponse.error(AppException.error());
    }
  }

  Future<APIResponse> put(
    String path, {
    dynamic body,
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.urlEncoded,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = _baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.multipart) {
      content = 'multipart/form-data';
    } else if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = UserPreferences.authToken;

    if (_appToken.isNotEmpty) {
      headers['Authorization'] = _appToken;
    }
    //Sometime for some specific endpoint it may require to use different Token
    if (token != null) {
      headers['Authorization'] = token;
    }

    try {
      final response = await _dio.put(
        url,
        data: body ?? {},
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        if (response.data['data'] != null) {
          return APIResponse.success(response.data['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data != null) {
            if (response.data.runtimeType == String) {
              return APIResponse.error(
                  AppException.errorWithMessage(response.data));
            } else if (response.data['message'] != null) {
              return APIResponse.error(AppException.errorWithMessage(
                  response.data['message'] ?? ''));
            } else {
              return const APIResponse.error(AppException.error());
            }
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
              AppException.errorWithMessage(e.response!.data['message']));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      debugPrint(e.stackTrace.toString());
      return const APIResponse.error(AppException.error());
    }
  }

  Future<APIResponse> delete(
    String path, {
    dynamic body,
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.urlEncoded,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = _baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.multipart) {
      content = 'multipart/form-data';
    } else if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = UserPreferences.authToken;

    if (_appToken.isNotEmpty) {
      headers['Authorization'] = _appToken;
    }
    //Sometime for some specific endpoint it may require to use different Token
    if (token != null) {
      headers['Authorization'] = token;
    }

    try {
      final response = await _dio.delete(
        url,
        data: body ?? {},
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        if (response.data['data'] != null) {
          return APIResponse.success(response.data['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data != null) {
            if (response.data.runtimeType == String) {
              return APIResponse.error(
                  AppException.errorWithMessage(response.data));
            } else if (response.data['message'] != null) {
              return APIResponse.error(AppException.errorWithMessage(
                  response.data['message'] ?? ''));
            } else {
              return const APIResponse.error(AppException.error());
            }
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
              AppException.errorWithMessage(e.response!.data['message']));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      debugPrint(e.stackTrace.toString());
      return const APIResponse.error(AppException.error());
    }
  }

  Future<APIResponse> get(
    String path, {
    String? newBaseUrl,
    String? token,
    Map<String, dynamic>? query,
    Map<String, String>? newHeader,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = _baseUrl + path;
    }

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = UserPreferences.authToken;

    if (_appToken.isNotEmpty) {
      headers['Authorization'] = _appToken;
    }
    //Sometime for some specific endpoint it may require to use different Token
    if (token != null) {
      headers['Authorization'] = token;
    }
    if (newHeader != null) {
      headers[newHeader.keys.first] = newHeader.values.first;
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      // ignore: unnecessary_null_comparison
      if (response == null) {
        return const APIResponse.error(AppException.error());
      }
      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        if (response.statusCode! == 404) {
          return const APIResponse.error(AppException.connectivity());
        } else if (response.statusCode! == 401) {
          return const APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 403) {
          if (response.data != null) {
            return APIResponse.error(
                AppException.errorWithMessage(response.data ?? ''));
          } else {
            return const APIResponse.error(AppException.error());
          }
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data != null) {
            if (response.data.runtimeType == String) {
              return APIResponse.error(
                  AppException.errorWithMessage(response.data));
            } else if (response.data['message'] != null) {
              return APIResponse.error(AppException.errorWithMessage(
                  response.data['message'] ?? ''));
            } else {
              return const APIResponse.error(AppException.error());
            }
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }
      return const APIResponse.error(AppException.error());
    }
  }
}
