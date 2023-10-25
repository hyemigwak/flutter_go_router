import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomErrorView  extends StatefulWidget {
  const CustomErrorView ({super.key,
    this.error,
    required this.errorMsg
  });

  final GoException? error;
  final String errorMsg;

  @override
  State<CustomErrorView> createState() => _CustomErrorViewState();
}

class _CustomErrorViewState extends State<CustomErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if(context.canPop()){
              context.pop();
            }
          },
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('에러 메세지'),
            Text(widget.errorMsg),
          ]
        )
      ),
    );
  }
}
