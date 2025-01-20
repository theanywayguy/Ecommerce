import 'package:ecommerceui/Components/my_listtile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  final String username;

  const MyDrawer({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 75,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              Text(
                "WELCOME BACK ${username}",
                style: GoogleFonts.jost(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),

              //Shop Tile
              MyListtile(
                text: "S H O P",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart tile
              MyListtile(
                text: "C A R T",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
              MyListtile(
                  text: "S E T T I N G S",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/setting_page');
                  })
            ],
          ),

          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListtile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/introPage');
              },
            ),
          ),
        ],
      ),
    );
  }
}
