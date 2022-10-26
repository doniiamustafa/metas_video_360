import 'package:video_360/network/requests.dart';
import 'package:video_360/network/responses.dart';

abstract class RemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final RemoteDataSource _remoteDataSource;
  RemoteDataSourceImpl(this._remoteDataSource);

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    return await _remoteDataSource.register(request);
  }
}
