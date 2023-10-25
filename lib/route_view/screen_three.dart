
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:router_test/provider/login_state.dart';
class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  @override
  Widget build(BuildContext context) {

    final isLogin = context.read<LoginProvider>().isLogin;

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
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('페이지 3', style: TextStyle(fontSize: 20)),
              Text('로그인 여부: ${isLogin ? 'yes yes' : 'no no no'}'),
              OutlinedButton(
                  onPressed: (){
                    context.pushNamed('four');
                  },
                  child: const Text('가즈아 4페이지로')
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
