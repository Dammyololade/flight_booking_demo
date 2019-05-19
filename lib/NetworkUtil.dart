import 'dart:convert';

import 'package:flight_reservouir/SessionManager.dart';
import 'package:http/http.dart' as http;

///
/// project: flight_reservouir
/// @package: 
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19
class NetworkUtil
{

  Future<http.Response> post(String url, Map<String, dynamic> params) async
  {
    var response = await http.post(url, body: params);
    return response;
  }

  Future<http.Response> get(String url) async
  {
    var response = await http.get(url, headers: {
      "Authorization" : "Bearer " + SessionManager.accessToken,
    });
    return response;
  }

}