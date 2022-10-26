// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:video_360/network/failures/failures.dart';
import 'package:video_360/network/requests.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, int>> register(RegisterRequest resquest);
}
