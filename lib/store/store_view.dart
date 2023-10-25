import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoreView extends StatefulWidget {
  const StoreView ({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {

  @override
  void initState() {
    super.initState();

    print('---store----');

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('스토어 뷰'),
            OutlinedButton(
                onPressed: (){
                  context.go('/store/test');
                },
                child: const Text('가즈아 첫번째 페이지로')
            ),
          ],
        )
      )
    );
  }
}
