import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:router_test/provider/login_state.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key, required this.id});

  final String id;

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final isLogin = context.read<LoginProvider>().isLogin;
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('페이지 2', style: TextStyle(fontSize: 20)),
              Text('my name is ${widget.id}'),

              Text('로그인 여부: ${isLogin ? 'yes yes' : 'no no no'}'),
              OutlinedButton(
                  onPressed: (){
                    context.pushNamed('three');
                  },
                  child: const Text('가즈아 3페이지로')
              ),
              OutlinedButton(
                  onPressed: (){
                    context.pushNamed('login');
                  },
                  child: const Text('로그인 페이지로~')
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
