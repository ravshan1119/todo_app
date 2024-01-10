import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/local/storage_repo/storage_repository.dart';
import 'package:todo_app/ui/router.dart';
import '../../models/universal_data.dart';
import '../../utils/error_message_dialog.dart';
import '../../utils/loading_dialog.dart';
import 'auth_service.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({required this.authService});

  final AuthService authService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String errorText = "";

  loginButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  signupButtonPressed() {
    passwordController.clear();
    emailController.clear();
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;
    showLoading(context: context);

    UniversalData universalData =
        await authService.signUpUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User signed Up", context: context);
        Navigator.pushReplacementNamed(context, RouteNames.tabs);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> loginUser(BuildContext context) async {
    String password = passwordController.text;
    String email = emailController.text;
    showLoading(context: context);

    UniversalData universalData =
        await authService.loginUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User logged in", context: context);
        StorageRepository.putBool("isLogin", true);
        Navigator.pushReplacementNamed(context, RouteNames.tabs);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    showLoading(context: context);

    UniversalData universalData = await authService.logOutUser();
    emailController.clear();
    passwordController.clear();
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User logged in", context: context);
        StorageRepository.deleteBool("isLogin");

        Navigator.pushReplacementNamed(context, RouteNames.auth);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await authService.signInWithGoogle();
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(
            message: "User Signed Up with Google.", context: context);
        StorageRepository.putBool("isLogin", true);

        Navigator.pushReplacementNamed(context, RouteNames.tabs);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }
//
// notify(bool value) {
//   isLoading = value;
//   notifyListeners();
// }
//
// manageMessage(BuildContext context, String error) {
//   ScaffoldMessenger.of(context)
//       .showSnackBar(SnackBar(content: Text(error.toString())));
//
//   isLoading = false;
//   notifyListeners();
// }
}

// _checkAuthState() {
//   FirebaseAuth.instance.authStateChanges().listen((User? user) {
//     if (user == null) {
//       print('User is currently signed out!');
//     } else {
//       print('User is signed in!');
//     }
//   });
// }
