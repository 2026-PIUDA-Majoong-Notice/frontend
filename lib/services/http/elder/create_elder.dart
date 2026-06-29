import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../../api/api_exception.dart';


Future<int> createElder({
  required int imageId,
  required String name,
  required String birth,
  required String gender,
  required String wakeTime,
  required String sleepTime,
  required bool usesDiaper,
  required String bowelType,
  required String mobilityLevel,
  required String cognitiveStatus,
}) async {
  try {
    final response = await ApiClient.dio.post(
      '/elders',
      data: {
        'imageId': imageId,
        'name': name,
        'birth': birth,
        'gender': gender,
        'wakeTime': wakeTime,
        'sleepTime': sleepTime,
        'usesDiaper': usesDiaper,
        'bowelType': bowelType,
        'mobilityLevel': mobilityLevel,
        'cognitiveStatus': cognitiveStatus,
      },
    );

    return response.data['elderId'] as int;
  } on DioException catch (e) {
    throw ApiException(
      e.response?.data?['message'] ?? '어르신 등록에 실패했어요.',
      statusCode: e.response?.statusCode,
    );
  }
}