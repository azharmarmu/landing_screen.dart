import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/firebase/firebase_client.dart';
import 'package:firebase_chat/domain/usecases/login_usecase.dart';
import 'package:firebase_chat/domain/usecases/logout_usecase.dart';
import 'package:firebase_chat/presentation/blocs/auth/auth_cubit.dart';
import 'package:firebase_chat/presentation/blocs/chat/chat_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.I;

Future init() async {
  await _configPlugins();
  _dataSources();
  _repositories();
  _useCases();
  _blocCubit();
}

Future<void> _configPlugins() async {
  //Firebase-Initialization
  await Firebase.initializeApp();

  getItInstance.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getItInstance.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  //FirebaseClient
  getItInstance.registerLazySingleton<FirebaseClient>(
    () => FirebaseClient(),
  );
}

void _dataSources() {
  // getItInstance.registerLazySingleton<AuthDataSource>(
  //   () => AuthDataSourceImpl(getItInstance()),
  // );
  // getItInstance.registerLazySingleton<ChatDataSource>(
  //   () => ChatDataSourceImpl(getItInstance()),
  // );
}

void _repositories() {
  // getItInstance.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(getItInstance()),
  // );
  // getItInstance.registerLazySingleton<ChatRepository>(
  //   () => ChatRepositoryImpl(getItInstance()),
  // );
}

void _useCases() {
  getItInstance.registerLazySingleton<LoginUC>(() => LoginUC(getItInstance()));
  getItInstance
      .registerLazySingleton<LogoutUC>(() => LogoutUC(getItInstance()));
}

void _blocCubit() {
  getItInstance.registerSingleton<AuthCubit>(AuthCubit(
    getItInstance(),
    getItInstance(),
  ));
  getItInstance.registerSingleton<ChatCubit>(ChatCubit(
    getItInstance(),
    getItInstance(),
  ));
}
