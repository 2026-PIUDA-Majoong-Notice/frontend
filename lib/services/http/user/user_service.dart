import 'package:dio/dio.dart';
import 'package:majoong_notice/services/api/api_client.dart';
import 'package:majoong_notice/services/api/api_exception.dart';
import 'package:majoong_notice/services/auth/token_storage.dart';

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
    print('=== DioException 발생 ===');
    print('상태코드: ${e.response?.statusCode}');
    print('응답 데이터: ${e.response?.data}');
    print('요청 URL: ${e.requestOptions.uri}');
    print('보낸 데이터: ${e.requestOptions.data}');
    throw ApiException(
      e.response?.data?['message'] ?? '회원가입에 실패했어요.',
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
      e.response?.data?['message'] ?? '로그인에 실패했어요.',
      statusCode: e.response?.statusCode,
    );
  }
}
