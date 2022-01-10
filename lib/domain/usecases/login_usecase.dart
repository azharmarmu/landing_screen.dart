import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/domain/entities/request/no_params.dart';
import 'package:firebase_chat/domain/entities/response/app_error.dart';

import '_use_case.dart';

class LoginUC extends UseCase<UserCredential, NoParams> {
  final FirebaseAuth _auth;

  LoginUC(this._auth);

  @override
  Future<Either<AppError, UserCredential>> call(NoParams params) async {
    try {
      return Right(await _auth.signInAnonymously());
    } catch (e) {
      return const Left(
        AppError(AppErrorType.firebase, error: 'Authorization Issue'),
      );
    }
  }
}
