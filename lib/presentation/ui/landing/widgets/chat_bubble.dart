import 'package:firebase_chat/core/app_screen_utils.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final Color color;
  final String msg;

  const ChatBubble({
    Key? key,
    required this.mainAxisAlignment,
    required this.color,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(16.sp),
            ),
          ),
          child: Text(msg),
        ),
      ],
    );
  }
}
