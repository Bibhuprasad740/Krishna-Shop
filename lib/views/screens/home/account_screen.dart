import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishna_electronics/utilities/stock_colors.dart';
import 'package:krishna_electronics/views/widgets/custom_button.dart';
import 'package:krishna_electronics/views/widgets/simple_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SimpleButton(
                  icon: Icons.inventory,
                  title: 'Orders',
                  onTap: () {},
                ),
                SimpleButton(
                  icon: Icons.favorite,
                  title: 'Wishlist',
                  onTap: () {},
                ),
                SimpleButton(
                  icon: Icons.contact_mail,
                  title: 'Addresses',
                  onTap: () {},
                ),
                SimpleButton(
                  icon: Icons.history,
                  title: 'Recently Viewed',
                  onTap: () {},
                ),
                SimpleButton(
                  icon: Icons.headset_mic,
                  title: 'Help Center',
                  onTap: () {},
                ),
                SimpleButton(
                  icon: Icons.local_shipping,
                  title: 'Delivery Requests',
                  onTap: () {},
                ),
                CustomButton(
                  title: 'Logout',
                  color: SC.accent1,
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
