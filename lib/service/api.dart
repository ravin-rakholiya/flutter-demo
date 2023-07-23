import 'dart:convert';
import 'package:CanLi/const/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class networkAPICall {
  final host = BASE_URL;
  String? _token;
  Map<String, String> commonHeaders = {
    "Content-Type": "application/json"
  }; //common header properties for all http requests
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    _token = await prefs.getString('token');
  }
  void httpGetRequest(String serviceUrl,
      void completionHandler(bool status, String data)) async {
    try {


      await getStringValuesSF();
      Map<String, String> getcommonHeaders = {
        "Accept": "*/*",
        "Content-Type": "*/*",
        "Authorization": "Bearer "+_token.toString()
      };
      var response = await http.get(Uri.parse(this.host + serviceUrl), headers: getcommonHeaders);
      print("=======response===========");
      print(response.body);
      print("======status code=========");
      print(response.statusCode);
      if (response.statusCode == 200) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(true, d);
      } else if (response.statusCode == 422) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(false, d);
      } else if (response.statusCode == 400) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(false, d);
      } else {
        completionHandler(false, "error");
      }
    } catch (e) {
      print(e);
      completionHandler(false, "error");
    }
  }

  void httpPostRequest(
      String serviceUrl,
      // Map<String, dynamic> headers,
      Map<String, dynamic> postData,
      void completionHandler(bool status, String data)) async {
    var httpHeaders = this.commonHeaders;
    await getStringValuesSF();
    print("62------"+_token.toString());
    if(_token!=null){
    httpHeaders["Authorization"]= "Bearer "+_token.toString();}
    print("60--------");
    print(httpHeaders);
    // if (headers != null) {
    //   httpHeaders.addAll(headers);
    // }

    try {
      print(this.host + serviceUrl);
      print(postData);
      var response = await http.post(Uri.parse(this.host + serviceUrl),
          body: json.encode(postData),
          headers: this.commonHeaders);
      print("=======response===========");
      print(response.body);
      print("======status code=========");
      print(response.statusCode);
      if (response.statusCode == 200) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(true, d);
      } else if (response.statusCode == 422) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(false, d);
      }else if (response.statusCode == 201) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(true, d);
      } else if (response.statusCode == 400) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(false, d);
      } else {
        completionHandler(false, "error");
      }
    } catch (e) {
      print(e);
      completionHandler(false, "error");
    }
  }
}
