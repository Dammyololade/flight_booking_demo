
import 'dart:convert';

import 'package:flight_reservouir/NetworkUtil.dart';
import 'package:flight_reservouir/SessionManager.dart';
import 'package:flight_reservouir/models/AuthToken.dart';
import 'package:flight_reservouir/models/ErrorModel.dart';
import 'package:flight_reservouir/models/SearchDataModel.dart';

///
/// project: flight_reservouir
/// @package: 
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19
class FlightService {

  NetworkUtil networkUtil = NetworkUtil();
  static const String TOKEN_URL = "https://test.api.amadeus.com/v1/security/oauth2/token";
  static const String CLIENT_SECRET = "noPX4LEv2j2c5pPd";
  static const String CLIENT_ID = "9EUyDJvzfPDs57kucVPODMtsYALPtmMN";
  static const String GRANT_TYPE = "client_credentials";
  static const int STATUS_OK = 200;
  static const String BASE_URL = "test.api.amadeus.com";
  static const String SEARCH_URL_PATH = "/v1/shopping/flight-offers";

  ///Get access token and save the token into
  ///session
  Future<bool> getAccessToken() async
  {
    Map<String, dynamic> params = {
      "client_secret" : CLIENT_SECRET,
      "client_id" : CLIENT_ID,
      "grant_type" : GRANT_TYPE,
    };
    bool success = true;
    try{
      var response = await networkUtil.post(TOKEN_URL, params);
      if(response.statusCode == STATUS_OK){
        AuthToken authToken = AuthToken.fromJson(json.decode(response.body));
        if(authToken != null){
          SessionManager.accessToken = authToken.accessToken;
          success = true;
        }
      } else{
        /// emit an error
        print(response.body);
      }
    }catch(error){
      print(error);
    }
    return success;
  }

  ///Connect to the api to get flights that matches the
  ///params,
  ///
  ///returns [SearchDataModel] if the response code is 200
  ///else [ErrorModel]
  Future searchFlights(Map<String, String> params)async
  {
    var result;
    Uri uri = Uri.https(BASE_URL, SEARCH_URL_PATH, params);
    print(uri);
    try{
      var response = await networkUtil.get(uri.toString());
      if(response.statusCode == STATUS_OK){
        result = SearchDataModel.fromJson(jsonDecode(response.body));
      }else{
        result = ErrorModel.fromJson(jsonDecode(response.body));
      }
    }catch(error){
      print(error);
    }
    return result;
  }

}