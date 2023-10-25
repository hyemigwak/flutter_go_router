import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_test/router.dart';

class ScreenOneChild3 extends StatefulWidget {
  const ScreenOneChild3({super.key});

  @override
  State<ScreenOneChild3> createState() => _ScreenOneChild3State();
}

class _ScreenOneChild3State extends State<ScreenOneChild3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if(context.canPop()) {
              context.pop();
            }
          },
        ),
      ),
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
            children: [
              const Spacer(),
              const Text('페이지 1 자식3'),
              OutlinedButton(
                onPressed: (){
                  // context.go('/two');
                },
                child: const Text('가즈아 자식 페이지'),
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
