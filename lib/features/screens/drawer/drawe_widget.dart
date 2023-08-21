import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:  const [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            accountName: Text(
              'Programmer',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            accountEmail: Text('Programmer@gmail.com',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
            currentAccountPicture: CircleAvatar(
              radius: 25,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home,color: Colors.black87,),
            title: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person,color: Colors.black87),
            title: Text(
              'My Account',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart,color: Colors.black87),
            title: Text(
              'My orders',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          ListTile(
            leading: Icon(Icons.watch_off_rounded,color: Colors.black87),
            title: Text(
              'My Watchlist',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.black87),
            title: Text(
              'Setting',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.black87),
            title: Text(
              'Log Out',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
