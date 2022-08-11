import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/app/pages/admin/admin_home.dart';
import 'package:ecommerce/app/pages/sign_in_page.dart';
import 'package:ecommerce/app/pages/user/user_home.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Stripe.publishableKey =
  // ALERT!: Note whether this is test key vs live key
  // ignore: lines_longer_than_80_chars
      'pk_test_51H7j2yI3MizAa4zxAhPNV33pjSzL69Punb8VCHdfdbB7uTse87IVHkupJaDxfjJsB8KoDpo6BEy0uRzjuWKpeWRQ00NAUF9wGr';
  // Stripe.merchantIdentifier = 'any string works';
  // await Stripe.instance.applySettings();
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
        signedInBuilder: (context) => const UserHome(),
        nonSignedInBuilder: (context) => const SignInPage(),
      ),
    );
  }
}
