import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:universities_task/models/response_model.dart';

class ApiManager {
  final String _baseUrl = "http://universities.hipolabs.com/";

  Future<ResponseModel> postData(Map<String, dynamic> formData) async {
    try {
      final response = await http.post(Uri.parse("${_baseUrl}Auth/Login"),
          body: jsonEncode(formData),
          headers: {"Content-Type": "application/json"});
      return _response(response);
    } on SocketException {
      return onException();
    }
  }

  Future<ResponseModel> getUniversitiesList() async {
    try {
      final response = await http.get(
          Uri.parse("${_baseUrl}search?country=United+states"),
          headers: {
            "Content-Type": "application/json"
          });
      return _response(response);
    } on SocketException {
      return onException();
    }
  }


  ResponseModel _response(http.Response response) {
    ResponseModel responseModel;
    print(response.statusCode);
    print(response.body);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        responseModel = ResponseModel(
            data: responseJson,
            message: "",
            statusCode: 200);
        return responseModel;

      default:
        try{
          var responseJson = json.decode(response.body.toString());
          responseModel = ResponseModel(
              data: null, message: "", statusCode: 500);
        }catch(e){
          responseModel = ResponseModel(
              data: null, message: "Internal server error", statusCode: 500);
        }
        return responseModel;
    }
  }
  onException(){
    return ResponseModel(
        data: null, message: "Internal server error", statusCode: 500);
  }
}
