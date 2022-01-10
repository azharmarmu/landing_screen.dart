import 'package:firebase_chat/core/app_screen_utils.dart';
import 'package:firebase_chat/presentation/blocs/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInputBox extends StatelessWidget {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController scrollController;

  ChatInputBox({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 4.h),
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.sp),
          topRight: Radius.circular(24.sp),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _chatController,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                hintText: 'Type something...',
                hintStyle: const TextStyle(color: Colors.black45),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          IconButton(
            onPressed: () {
              final message = _chatController.text.trim();
              final id = _chatController.text.trim();
              if (message.isNotEmpty) {
                BlocProvider.of<ChatCubit>(context).sendMessage(message, id);
                _chatController.clear();
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
