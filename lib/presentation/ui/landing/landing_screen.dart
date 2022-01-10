import 'package:firebase_chat/core/app_routes.dart';
import 'package:firebase_chat/core/di/dependency_injection.dart';
import 'package:firebase_chat/presentation/blocs/auth/auth_cubit.dart';
import 'package:firebase_chat/presentation/blocs/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/chat_input_box_widget.dart';
import 'widgets/chat_message_list.dart';

class LandingScreen extends StatelessWidget {
  final _authCubit = getItInstance<AuthCubit>();
  final _chatCubit = getItInstance<ChatCubit>();
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      bloc: _authCubit,
      listener: (_, state) {
        if (state is UnauthenticatedState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        }
      },
      child: BlocProvider.value(
        value: _chatCubit,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Chat'),
            actions: [
              IconButton(
                onPressed: () => _authCubit.logout(),
                icon: const Icon(Icons.logout),
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ChatMessageList(
                  scrollController: scrollController,
                ),
              ),
              ChatInputBox(
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
