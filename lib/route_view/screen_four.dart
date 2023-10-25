
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_test/router.dart';

class ScreenFour extends StatefulWidget {
  const ScreenFour({super.key});

  @override
  State<ScreenFour> createState() => _ScreenFourState();
}

class _ScreenFourState extends State<ScreenFour> {
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
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('페이지 4', style: TextStyle(fontSize: 20)),
              OutlinedButton(
                  onPressed: (){
                    context.push('/five',
                        extra: const ScreenFiveArguments(
                          id: 20,
                          name: 'amy is princess',
                          treatmentId: 400,
                        )
                    );
                  },
                  child: const Text('가즈아 다섯 번째 페이지로')
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
