import 'package:flutter_pagination/model.dart';
import 'package:http/http.dart';

class Network {
  // request data from internet
  static Future<ReqResListUsers> getCategories(int page, int perPage) async {
    String urlPage = 'page=$page';
    String urlPerPage = 'per_page=$perPage';
    String urlReqRes = 'https://reqres.in/api/users?$urlPage&$urlPerPage';
    // waiting for response
    Response response = await get(urlReqRes);
    // if status code of response is 200 set response to model
    if (response.statusCode == 200)
      return ReqResListUsers.fromJson(response.body);
    else
      throw Exception(response.statusCode);
  }
}
