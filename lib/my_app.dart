import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_routes.dart';
import 'core/app_screen_utils.dart';
import 'core/di/dependency_injection.dart';
import 'presentation/blocs/auth/auth_cubit.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        ScreenUtils.init(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
        );
        return BlocProvider.value(
          value: getItInstance<AuthCubit>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (_, child) => child!,
            initialRoute: AppRoutes.login,
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}
