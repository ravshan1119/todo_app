import 'package:flutter/material.dart';

import '../../data/local/storage_repo/storage_repository.dart';
import '../router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isFirst = StorageRepository.getBool("is_first");
    bool isLogin = StorageRepository.getBool("isLogin");
    if (context.mounted) {
      Navigator.pushReplacementNamed(
        context,
        isFirst
            ? isLogin
                ? RouteNames.tabs
                : RouteNames.auth
            : RouteNames.boarding,
      );
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Spalsh Screen"),
      ),
    );
  }
}
