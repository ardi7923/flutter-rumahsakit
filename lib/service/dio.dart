import 'package:dio/dio.dart';
import 'package:flutter_rumahsakit/interceptor/logging_interceptor.dart';
import 'package:get_storage/get_storage.dart';

Dio dio(){

  Dio dio = new Dio();
  final authData =  GetStorage();

  dio.options.baseUrl        = "http://192.168.43.171/rumahsakit/public/api/v1";
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 5000;
  dio.options.responseType   = ResponseType.json;

  dio.options.headers['accept'] = "application/json";

  if(authData.hasData('token')){
    dio.options.headers['Authorization'] = "Bearer "+ authData.read('token');
  }

  dio.interceptors.add(LoggingInterceptors());
  
  return dio;
}