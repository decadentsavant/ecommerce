import 'package:ecommerce/app/providers.dart';
import 'package:ecommerce/widgets/product_banner.dart';
import 'package:ecommerce/widgets/product_display.dart';
import 'package:ecommerce/widgets/user_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserHome extends ConsumerWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UserTopBar(
                leadingIconButton: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    ref.read(firebaseAuthProvider).signOut();
                  },
                ),
              ),
              const ProductBanner(),
              const Text(
                'Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'View all of our product',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const ProductsDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}
