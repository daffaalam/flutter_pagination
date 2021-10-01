import 'package:dio/dio.dart';

import '../common/constant.dart';
import '../model/yu_gi_oh.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
    ),
  );

  static Future<YuGiOh?> getCardInfo({
    required int count,
    required int offset,
  }) async {
    try {
      Response<Map<String, dynamic>> _response;
      _response = await _dio.get<Map<String, dynamic>>(
        '/cardinfo.php',
        queryParameters: <String, dynamic>{
          'num': count,
          'offset': offset,
        },
      );
      return YuGiOh.fromMap(_response.data ?? <String, dynamic>{});
    } catch (e) {
      return null;
    }
  }
}
