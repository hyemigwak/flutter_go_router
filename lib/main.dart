import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:router_test/provider/login_state.dart';
import 'package:router_test/route_view/screen_one.dart';
import 'package:router_test/router.dart';
import 'package:uni_links/uni_links.dart';


bool _initialUriIsHandled = false;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: true,
      title: 'go_router_demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.navigationShell});


  final StatefulNavigationShell navigationShell;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void onItemTapped (int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.navigationShell.goBranch(index);
  }


  @override
  void initState() {
    super.initState();
    handleIncomingLinks();
    handleInitialUri();
  }

  void handleIncomingLinks() {
    uriLinkStream.listen((Uri? uri) {
      if (!mounted) return;
      final String? deeplinkRoute = uri?.path;
      if(deeplinkRoute != null) {
        context.go(deeplinkRoute);
      }

    }, onError: (Object err) {
      print('err: $err');
    });

  }

  void handleInitialUri() async {
    if (_initialUriIsHandled == false) {
      _initialUriIsHandled = true;
      final Uri? uri = await getInitialUri();
      if (uri != null) {
        final String deeplinkRoute = uri.path;
        if (!mounted) return;
        context.go(deeplinkRoute);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Go router 가보자고'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if(context.canPop()){
              context.pop();
            }
          },
        ),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: Colors.deepPurpleAccent),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            activeIcon: Icon(Icons.shopping_basket, color: Colors.deepPurpleAccent),
            label: '스토어',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            activeIcon: Icon(Icons.heart_broken, color: Colors.deepPurpleAccent),
            label: '심리',
          ),
        ],
        currentIndex: selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.lightGreen,
        onTap: onItemTapped, // 선언했던 onItemTapped
      ),
    );
  }
}
