import 'package:http/http.dart' as http;
import 'dart:convert';

class Authenticatelogin {
  static Future<String> authenticate(String email, String password) async {
    Uri url = Uri.parse('http://115.124.111.239:8089/web/session/authenticate');
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=29b627435a9155828b2311eb7b9aa1c57a43de65'
    };
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode({
        "params": {
          "db": "Warehouse-Zota-25-05",
          "login": email,
          "password": password,
          "context": {}
        },
        "id": 1006036493
      }),
    );
    final responseData = json.decode(response.body);
    //print(responseData['result']);
    //print('Response data is $responseData');
    if (responseData['result'] != null) {
      return 'Success';
    } else {
      return 'Failed';
    }
  }
}
