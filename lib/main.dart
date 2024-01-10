import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/ui/router.dart';
import 'package:todo_app/utils/theme.dart';
import 'data/local/storage_repo/storage_repository.dart';
import 'data/remote/auth_provider.dart';
import 'data/remote/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(authService: AuthService()),
      lazy: true,
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: RouteNames.initial,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
