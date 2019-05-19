///
/// project: flight_reservouir
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19
class AuthToken {
  String type;
  String username;
  String applicationName;
  String clientId;
  String tokenType;
  String accessToken;
  int expiresIn;
  String state;
  String scope;

  AuthToken(
      {this.type,
        this.username,
        this.applicationName,
        this.clientId,
        this.tokenType,
        this.accessToken,
        this.expiresIn,
        this.state,
        this.scope});

  AuthToken.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    username = json['username'];
    applicationName = json['application_name'];
    clientId = json['client_id'];
    tokenType = json['token_type'];
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    state = json['state'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['username'] = this.username;
    data['application_name'] = this.applicationName;
    data['client_id'] = this.clientId;
    data['token_type'] = this.tokenType;
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['state'] = this.state;
    data['scope'] = this.scope;
    return data;
  }
}

