import 'dart:io';
import 'package:book_app/Core/utilities/app_router.dart';
import 'package:book_app/Features/Auth/data/repo/repo_implement.dart';
import 'package:book_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CustomDrawer extends StatefulWidget {  
  const CustomDrawer({super.key});  

  @override  
  State<CustomDrawer> createState() => _CustomDrawerState();  
}  

class _CustomDrawerState extends State<CustomDrawer> {  
  File? _image ; // Directly retrieve image  

  @override  
  Widget build(BuildContext context) {  
    var name = mybox!.get("person") ?? ["User", "user@example.com"]; // Default values  

    return Drawer(  
      child: ListView(  
        padding: EdgeInsets.zero,  
        children: [  
          _buildUserAccountsDrawerHeader(name),  
          _buildListTile(Icons.shopping_cart_outlined, 'Shopping', () {  
            // Add shopping action here  
          }),  
          Divider(),  
          _buildListTile(Icons.logout, 'Logout', () async {  
            await mybox!.clear();  
            await AuthRepoImplement().deleteUser();  
            GoRouter.of(context).pushReplacement(AppRouter.kloginview);  
          }),  
          _buildListTile(Icons.close, 'Exit', () {  
            SystemNavigator.pop();  
          }, isBold: true),  
        ],  
      ),  
    );  
  }  

  UserAccountsDrawerHeader _buildUserAccountsDrawerHeader(List<String> name) {  
    return UserAccountsDrawerHeader(  
      accountName: Text(name[0]),  
      accountEmail: Text(name[1]),  
      currentAccountPicture: Stack(  
        alignment: Alignment.center,  
        children: [  
          ClipOval(  
            child: CircleAvatar(  
              radius: 50,  
              child: _image == null  
                  ? Icon(Icons.person, size: 50) // Default icon if no image  
                  : Image.file(  
                      _image!,  
                      fit: BoxFit.cover,  
                      width: 100,  
                      height: 100,  
                    ),  
            ),  
          ),  
          Positioned(  
            bottom: 0,  
            right: -1,  
            child: GestureDetector(  
              onTap: pickImage,  
              child: CircleAvatar(  
                backgroundColor: Colors.blue,  
                radius: 15,  
                child: Icon(  
                  Icons.camera_alt,  
                  size: 16,  
                  color: Colors.white,  
                ),  
              ),  
            ),  
          ),  
        ],  
      ),  
      decoration: BoxDecoration(  
        color: Colors.blue,  
        image: DecorationImage(  
          image: AssetImage('assets/images/personal.jpg'),  
          fit: BoxFit.cover,  
        ),  
      ),  
    );  
  }  

  ListTile _buildListTile(IconData icon, String title, VoidCallback onTap, {bool isBold = false}) {  
    return ListTile(  
      leading: Icon(icon),  
      title: Text(  
        title,  
        style: TextStyle(fontSize: 19, fontWeight: isBold ? FontWeight.bold : FontWeight.w500),  
      ),  
      onTap: onTap,  
    );  
  }  

  void pickImage() async {  
    final ImagePicker _picker = ImagePicker();  
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);  
    if (image != null) {  
      setState(() {  
        _image = File(image.path);  
         
      });  
    }  
  }  
}