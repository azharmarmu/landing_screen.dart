import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/domain/entities/request/no_params.dart';
import 'package:firebase_chat/domain/entities/response/app_error.dart';

import '_use_case.dart';

class LogoutUC extends UseCase<void, NoParams> {
  final FirebaseAuth _auth;

  LogoutUC(this._auth);

  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    try {
      return Right(await _auth.signOut());
    } catch (e) {
      return const Left(
        AppError(AppErrorType.firebase, error: 'Authorization Issue'),
      );
    }
  }
}
