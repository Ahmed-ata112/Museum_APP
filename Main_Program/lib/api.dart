import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class DBManager {
  //This stores the url that we'll deal with the restful api through
  //for web-based applications this will be http://localhost:5000/
  //for mobile-based applications (emulators) this will be http://10.0.2.2:5000
  static const String BASE_URL = 'http://10.0.2.2:5000';
  static Future<int> executeNonQuery(String query) async {
    var queryParameters = {'query': query};
    var response = await http.post(Uri.parse('${BASE_URL}/ExecuteNonQuery'),
        body: queryParameters);
    int ret = json.decode(response.body)["result"];
    return ret; // 1 if process is done //0 otherwse
  }

  static Future<int> executeNonQueryProc(String ProcName, int params) async {
    var queryParameters = {'procName': ProcName, 'Parameters': params};
    var response = await http.post(Uri.parse('${BASE_URL}/ExecuteNonQueryproc'),
        body: queryParameters);
    int ret = json.decode(response.body)["result"];
    return ret; // 1 if process is done //0 otherwse
  }

  static Future<dynamic> executeScaler(String query) async {
    var queryParameters = {"query": query};
    var response = await http.post(Uri.parse('${BASE_URL}/ExecuteScaler'),
        body: queryParameters);
    dynamic ret;
    if (response.statusCode == 200) {
      ret = json.decode(response.body)["result"];
    } else {
      print(response.statusCode);
      return null;
    }

    return ret; // return output as a dynamic
  }

  static Future<dynamic> executeReader(String query) async {
    var queryParameters = {'query': query};
    var response = await http.post(Uri.parse('${BASE_URL}/ExecuteReader'),
        body: queryParameters);

    dynamic ret = json.decode(response.body); // list<list<dynamic>>
    return ret; // list of lists
  }
}
