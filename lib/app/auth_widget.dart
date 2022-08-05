import 'package:ecommerce/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
    required this.adminSignedInBuilder,
    super.key,
  });

  final WidgetBuilder signedInBuilder;
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder adminSignedInBuilder;

// TODO(Corey): store this somewhere else on production
  // final adminEmail = 'admin@admin.com';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// TODO(Corey): store this somewhere else
    const adminEmail = 'admin@admin.com';
    final authStateChanges = ref.watch(authStateChangesProvider);

    return authStateChanges.when(
      data: (user) => user != null
          ? user.email == adminEmail
              ? adminSignedInBuilder(context)
              : signedInBuilder(context)
          : nonSignedInBuilder(context),
      error: (_, __) => const Scaffold(
        body: Center(
          child: Text('Something went wrong'),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
