// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dartz/dartz.dart';
import 'package:video_360/data/model/register_model.dart';
import 'package:video_360/domain/repository/register_repository.dart';
import 'package:video_360/network/failures/failures.dart';
import 'package:video_360/network/requests.dart';

class RegisterUsecase {
  final Repository repository;
  RegisterUsecase({required this.repository});

  Future<Either<Failure, int>> execute(RegisterModel registerModel) async {
    return await repository.register(RegisterRequest(
        name: registerModel.name,
        proficiency: registerModel.proficiency,
        phoneNumber: registerModel.phoneNumber));
  }
}
