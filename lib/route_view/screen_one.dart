import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  @override
  void initState() {
    super.initState();
    print('----main----');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text('페이지 1', style: TextStyle(fontSize: 20)),
            OutlinedButton(
              onPressed: (){
                context.go('/child');
              },
              child: const Text('가즈아 자식1 gogogo', style: TextStyle(color: Colors.black)),
            ),
            OutlinedButton(
              onPressed: (){
                try {
                  context.go('/undefined');
                } catch (e) {
                  print('------e::: $e');
                }

              },
              child: const Text('에러페이지', style: TextStyle(color: Colors.red)),
            ),
            OutlinedButton(
              onPressed: (){
                context.push('/child/child2');
              },
              child: const Text('가즈아 자식2 push', style: TextStyle(color: Colors.black)),
            ),
            OutlinedButton(
              onPressed: (){
                context.pushNamed('foo');
              },
              child: const Text('path test', style: TextStyle(color: Colors.black)),
            ),
            OutlinedButton(
              onPressed: (){
                context.go('/animation');
              },
              child: const Text('화면 전환', style: TextStyle(color: Colors.black)),
            ),
            OutlinedButton(
              onPressed: (){
                context.push('/login');
              },
              child: const Text('로그인 페이지로~', style: TextStyle(color: Colors.black)),
            ),
            const Spacer(),
          ]
        ),
      ),
    );
  }
}
