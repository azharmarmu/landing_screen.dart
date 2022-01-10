import 'package:firebase_chat/core/app_routes.dart';
import 'package:firebase_chat/core/di/dependency_injection.dart';
import 'package:firebase_chat/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final AuthCubit _authCubit = getItInstance<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<AuthCubit, AuthState>(
              listener: (_, state) {
                if (state is AuthenticatedState) {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.landing);
                }
              },
              builder: (_, state) {
                return ElevatedButton(
                  onPressed: () => _authCubit.login(),
                  child: const Text('Anonymous SignIn'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
