import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MindCareView extends StatefulWidget {
  const MindCareView ({super.key});

  @override
  State<MindCareView> createState() => _MindCareViewState();
}

class _MindCareViewState extends State<MindCareView> {

  @override
  void initState() {
    super.initState();
    print('---mind----');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
              children: [
                Text('심리 뷰'),
              ],
            )
        )
    );
  }
}
