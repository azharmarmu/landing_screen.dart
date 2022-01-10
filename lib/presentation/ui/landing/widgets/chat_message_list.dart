import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/core/app_screen_utils.dart';
import 'package:firebase_chat/presentation/blocs/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_bubble.dart';

class ChatMessageList extends StatelessWidget {
  final ScrollController scrollController;

  const ChatMessageList({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: StreamBuilder<QuerySnapshot>(
        stream: BlocProvider.of<ChatCubit>(context).receiveChat(),
        builder: (_, snapshot) {
          debugPrint('snapshot val : ${snapshot.data}');
          final QuerySnapshot? data = snapshot.data;
          if (data != null) {
            final List<QueryDocumentSnapshot> docs = data.docs;
            if (docs.isNotEmpty) {
              return ListView.separated(
                controller: scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 4.h,
                ),
                itemBuilder: (_, index) {
                  final Map<String, dynamic>? data =
                      docs[index].data() as Map<String, dynamic>?;
                  if (data != null) {
                    final bool myMessage = BlocProvider.of<ChatCubit>(context)
                        .fromMe('${data['userId']}');
                    return ChatBubble(
                      mainAxisAlignment: myMessage
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      color: myMessage
                          ? Colors.blueGrey.shade400
                          : Colors.greenAccent.shade400,
                      msg: data['text'].toString(),
                    );
                  }
                  return const SizedBox.shrink();
                },
                separatorBuilder: (_, state) => SizedBox(height: 4.h),
                itemCount: docs.length,
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
