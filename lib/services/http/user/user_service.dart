import 'package:dio/dio.dart';
import 'package:majoong_notice/services/api/api_client.dart';
import 'package:majoong_notice/services/api/api_exception.dart';
import 'package:majoong_notice/services/auth/token_storage.dart';

String _extractErrorMessage(dynamic data, String fallback) {
  if (data is Map && data['message'] is String) {
    return data['message'] as String;
  }
  return fallback;
}

Future<int> signUp({
  required String email,
  required String password,
  required String passwordConfirm,
  required String name,
}) async {
  try {
    final response = await ApiClient.dio.post(
      '/users',
      data: {
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'name': name,
      },
    );

    final userId = response.data['userId'];

    if (userId is num) {
      return userId.toInt();
    }

    throw ApiException('회원가입 응답이 올바르지 않아요.');
  } on DioException catch (e) {
    throw ApiException(
      _extractErrorMessage(e.response?.data, '회원가입에 실패했어요.'),
      statusCode: e.response?.statusCode,
    );
  }
}

Future<void> login({
  required String email,
  required String password,
}) async {
  try {
    final response = await ApiClient.dio.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    final accessToken = response.data['accessToken'];
    final refreshToken = response.data['refreshToken'];

    if (accessToken is! String || refreshToken is! String) {
      throw ApiException('로그인 응답이 올바르지 않아요.');
    }

    await TokenStorage.saveAccessToken(accessToken);
    await TokenStorage.saveRefreshToken(refreshToken);
  } on DioException catch (e) {
    throw ApiException(
      _extractErrorMessage(e.response?.data, '로그인에 실패했어요.'),
      statusCode: e.response?.statusCode,
    );
  }
}
