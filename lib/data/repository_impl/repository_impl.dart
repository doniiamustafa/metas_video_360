// ignore_for_file: import_of_legacy_library_into_null_safe


import 'package:dartz/dartz.dart';
import 'package:video_360/application/app_prefs.dart';
import 'package:video_360/application/injectors.dart';
import 'package:video_360/domain/repository/register_repository.dart';
import 'package:video_360/network/app_service_client/app_service_client.dart';
import 'package:video_360/network/requests.dart';
import 'package:video_360/network/failures/failures.dart';

class RegisterRepositoryImpl implements Repository {
  final AppServiceClient _appServiceClient;
  RegisterRepositoryImpl(this._appServiceClient);
  @override
  Future<Either<Failure, int>> register(RegisterRequest request) async {
    try {
      final response = await _appServiceClient.register(request);
      final AppPreferences appPreferences = instance<AppPreferences>();
      appPreferences.setUserId(response.id);
      return Right(response.id);
    } catch (e) {
      return left(Failure());
    }
  }
}
