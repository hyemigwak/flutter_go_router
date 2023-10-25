
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenOneChild2 extends StatefulWidget {
  const ScreenOneChild2({
    super.key,
  });


  @override
  State<ScreenOneChild2> createState() => _ScreenOneChild2State();
}

class _ScreenOneChild2State extends State<ScreenOneChild2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
            children: [
              const Spacer(),
              const Text('페이지 1 자식2'),
              OutlinedButton(
                onPressed: (){

                },
                child: const Text('가즈아 자식3 페이지'),
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
