import 'dart:convert';
import 'package:CanLi/const/config.dart';
import 'package:http/http.dart' as http;

class networkAPICall {
  final host = BASE_URL;
  Map<String, String> commonHeaders = {
    "Accept": "*/*",
    "Content-Type": "*/*"
  }; //common header properties for all http requests

  void httpPostRequest(
      String serviceUrl,
      // Map<String, dynamic> headers,
      Map<String, dynamic> postData,
      void completionHandler(bool status, String data)) async {
    var httpHeaders = this.commonHeaders;
    // if (headers != null) {
    //   httpHeaders.addAll(headers);
    // }

    try {
      print(this.host + serviceUrl);
      print(postData);
      var response = await http.post(Uri.parse(this.host + serviceUrl),
          body: json.encode(postData),headers: {"Content-Type":"application/json"});
      print("=======response===========");
      print(response.body);
      print("======status code=========");
      print(response.statusCode);
      if (response.statusCode == 200) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(true, d);
      } else if(response.statusCode == 422 ){
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(false, d);
      } else if(response.statusCode == 400 ) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(false, d);
      }else {
        completionHandler(false, "error");
      }
    } catch (e) {
      print(e);
      completionHandler(false, "error");
    }
  }
}