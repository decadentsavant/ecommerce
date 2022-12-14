import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String get adminEmail => 'admin@admin.com';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangesProvider);

    return authStateChanges.when(
      data: (user) => user != null
          ? user.email == adminEmail
              ? adminSignedInBuilder(context)
              : signedInHandler(
                  context,
                  ref,
                  user,
                )
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

  FutureBuilder<UserData?> signedInHandler(
    BuildContext context,
    WidgetRef ref,
    User user,
  ) {
    final database = ref.read(databaseProvider)!;
    final potentialUserFuture = database.getUser(user.uid);
    return FutureBuilder<UserData?>(
      future: potentialUserFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final potentialUser = snapshot.data;
          if (potentialUser == null) {
            database.addUser(
              UserData(
                email: user.email != null ? user.email! : '',
                uid: user.uid,
              ),
            );
          }
          if (user.email == adminEmail) {
            return adminSignedInBuilder(context);
          }
          return signedInBuilder(context);
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
