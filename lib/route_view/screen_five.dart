
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:router_test/router.dart';

class ScreenFive extends StatefulWidget {
  const ScreenFive({
    super.key,
    required this.arguments,
  });

  final ScreenFiveArguments arguments;

  @override
  State<ScreenFive> createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  @override
  Widget build(BuildContext context) {
    print('arguments::: ${widget.arguments}');
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
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Text('페이지 5', style: TextStyle(fontSize: 20)),
              Text('id is ${widget.arguments.id.toString()}'),
              Text('name is ${widget.arguments.name}'),
              Text('treatmentId is ${widget.arguments.treatmentId.toString()}'),
              OutlinedButton(
                  onPressed: (){
                      context.go('/one');
                  },
                  child: const Text('가즈아 첫번째 페이지로')
              ),
              const Spacer(),
            ]
        ),
      ),
    );
  }
}
