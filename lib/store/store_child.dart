import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreChildView extends StatefulWidget {
  const StoreChildView ({super.key});

  @override
  State<StoreChildView> createState() => _StoreChildViewState();
}

class _StoreChildViewState extends State<StoreChildView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: Column(
              children: [
                Text('스토어 자식 뷰', style: TextStyle(color: Colors.deepPurple)),
              ],
            )
        )
    );
  }
}
