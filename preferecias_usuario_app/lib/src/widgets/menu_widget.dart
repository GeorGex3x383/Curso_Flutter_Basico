import 'package:flutter/material.dart';
import 'package:preferecias_usuario_app/src/pages/home_page.dart';
import 'package:preferecias_usuario_app/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover,
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.greenAccent),
            title: Text('Home'),
            onTap: ()=> Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),

          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.greenAccent),
            title: Text('Party Mode'),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.people, color: Colors.greenAccent),
            title: Text('People'),
            onTap: (){},
          ),

          ListTile(
            leading: Icon(Icons.settings, color: Colors.greenAccent),
            title: Text('Settings'),
            onTap: (){
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            }
          ),
        ],
      ),
    );
  }
}