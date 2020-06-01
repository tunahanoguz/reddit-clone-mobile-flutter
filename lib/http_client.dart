import "package:dio/dio.dart";

BaseOptions options = new BaseOptions(
  baseUrl: "http://reddit-clone-backend.test/api",
);

Dio dio = new Dio(options);