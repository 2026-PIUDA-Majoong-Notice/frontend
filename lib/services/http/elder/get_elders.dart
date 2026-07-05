import 'package:majoong_notice/services/api/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:majoong_notice/model/elder.dart';
import 'package:majoong_notice/services/api/api_client.dart';

Future<List<Elder>> getElders() async {
  try {
    final response = await ApiClient.dio.get('elders');

    final elders = response.data['elders'] as List;
    return elders.map((e) => Elder.fromJson(e)).toList();
  } on DioException catch (e) {
    throw ApiException(e.response?.data?['massages']??'어르신 목록을 불러오지 못했어요.', statusCode: e.response?.statusCode);
  }
}