import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/app/pages/admin_home.dart';
import 'package:ecommerce/app/pages/sign_in_page.dart';
import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange,
        ),
      ),
      home: AuthWidget(
        adminSignedInBuilder: (context) => const AdminHome(),
        signedInBuilder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Signed In'),
                ElevatedButton(
                  onPressed: () {
                    ref.read(firebaseAuthProvider).signOut();
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ),
        ),
        nonSignedInBuilder: (context) => const SignInPage(),
      ),
    );
  }
}
