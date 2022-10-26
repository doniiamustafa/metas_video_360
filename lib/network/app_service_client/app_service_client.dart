import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:video_360/network/responses.dart';
import 'package:video_360/network/requests.dart';
import 'package:video_360/application/constants.dart';

part 'app_service_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST(Constants.registerApi)
  Future<RegisterResponse> register(@Body() RegisterRequest request);
}
