import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/remote/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.onChanged}) : super(key: key);

  final VoidCallback onChanged;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Prodil Screen"),
            ElevatedButton(
              onPressed: () async {
                context.read<AuthProvider>().logOutUser(context);
              },
              child: const Text(
                "logout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
