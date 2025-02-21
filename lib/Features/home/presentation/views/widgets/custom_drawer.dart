import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Features/Auth/data/repo/repo_implement.dart';
import 'package:book_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
  
    var name =
        mybox!.get("person") ?? ["User", "user@example.com"]; // Default values

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name[0]),
            accountEmail: Text(name[1]),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/my_image.jpg',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text(
              'Shopping',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'Favorite',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
          ),
         
          Divider(),
          GestureDetector(
            onTap: () async {
              await mybox!.clear();
              await AuthRepoImplement().deleteUser();
              GoRouter.of(context).pushReplacement(AppRouter.kloginview);
            },
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text(
                'Delete Account',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'Exit',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
