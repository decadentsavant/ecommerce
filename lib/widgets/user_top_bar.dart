import 'package:ecommerce/app/pages/user/user_bag.dart';
import 'package:flutter/material.dart';

class UserTopBar extends StatelessWidget {
  const UserTopBar({
    required this.leadingIconButton,
    super.key,
  });

  final IconButton leadingIconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        leadingIconButton,
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
           
          },
        ),
        IconButton(
          onPressed: () {
             Navigator.push<MaterialPageRoute<dynamic>>(
              context,
              MaterialPageRoute(
                builder: (context) => const UserBag(),
              ),
            );
          },
          icon: const Icon(
            Icons.shopping_bag,
          ),
        ),
      ],
    );
  }
}
