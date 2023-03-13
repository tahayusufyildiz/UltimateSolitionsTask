import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ultimate_solitions_task/view/login_view.dart';
import 'package:ultimate_solitions_task/view/splashScreen.dart';

Timer? _rootTimer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AppRoot();
}

class AppRoot extends StatefulWidget {
  @override
  AppRootState createState() => AppRootState();
}

class AppRootState extends State<AppRoot> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeTimer();
  }

  void initializeTimer() {
    if (_rootTimer != null) _rootTimer?.cancel();
    const time = const Duration(minutes: 1);
    _rootTimer = Timer(time, () {
      logOutUser();
    });
  }

  void logOutUser() async {
    _rootTimer?.cancel();
  }

  void _handleUserInteraction([_]) {
    if (_rootTimer != null && !_rootTimer!.isActive) {
      return;
    }
    _rootTimer?.cancel();

    initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _handleUserInteraction,
      onPointerMove: _handleUserInteraction,
      onPointerUp: _handleUserInteraction,
      child: MaterialApp(
          title: 'example',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const SplashScreen()),
    );
  }
}
