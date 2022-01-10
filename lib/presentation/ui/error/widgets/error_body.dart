import 'package:firebase_chat/core/app_screen_utils.dart';
import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  final String? message;

  const ErrorBody({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(4.sp),
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.sp),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.error_outline, color: Colors.redAccent),
                  SizedBox(width: 4.w),
                  const Text('Error'),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                message!,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
