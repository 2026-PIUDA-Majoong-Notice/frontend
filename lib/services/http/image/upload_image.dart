import 'package:dio/dio.dart';

import '../../api/api_client.dart';
import '../../api/api_exception.dart';


Future<int> uploadImage({
  required String imagePath,
}) async {
  try {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imagePath),
    });

    final response = await ApiClient.dio.post(
      '/images',
      data: formData,
      options: Options(
        contentType: 'multipart/form-data',
      ),
    );

    return response.data['imageId'] as int;
  } on DioException catch (e) {
    throw ApiException(
      e.response?.data?['message'] ?? '이미지 업로드에 실패했어요.',
      statusCode: e.response?.statusCode,
    );
  }
}