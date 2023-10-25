import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenOneChild extends StatefulWidget {
  const ScreenOneChild({super.key});

  @override
  State<ScreenOneChild> createState() => _ScreenOneChildState();
}

class _ScreenOneChildState extends State<ScreenOneChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Column(
            children: [
              const Spacer(),
              const Text('페이지 1 자식'),
              OutlinedButton(
                onPressed: (){
                  context.go('/child/child2');
                },
                child: const Text('가즈아 자식 2페이지'),
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
