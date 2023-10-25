import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:router_test/provider/login_state.dart';
import 'package:router_test/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.from});

  final String? from;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final String redirectUrl = router.routeInformationProvider.value.location;
    print('redirectUrl::::: $redirectUrl');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 228, 228, 1),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text('저는 로그인 페이지에요', style: TextStyle(fontSize: 20)),
            TextButton(
              onPressed: () {
                context.read<LoginProvider>().tryLogin(true);
                if(redirectUrl != '/login') {
                  context.pushReplacement(redirectUrl!);
                }
              },
              child: const Text('로그인'),
            ),

            TextButton(
              onPressed: () {
                context.read<LoginProvider>().tryLogin(false);
                if(context.canPop()) {
                  context.pop();
                }
              },
              child: const Text('로그인 하기시러!'),
            ),
            const Spacer(),
          ]
        ),
      ),
    );
  }
}
