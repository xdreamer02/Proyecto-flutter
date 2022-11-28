import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proy_flutter/preferences/preferences.dart';
import 'package:proy_flutter/providers/theme_provider.dart';
import 'package:proy_flutter/widgets/custom_Drawer.dart';
import 'package:settings_ui/settings_ui.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        centerTitle: true,
        actions: [
          Switch.adaptive(
              value: Preferences.theme,
              onChanged: ((value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.setOscuro() : themeP.setClaro();
                setState(() {});
              }))
        ],
      ),
      body:   SettingsList( 
      sections: [
        SettingsSection(
          title: Text('Common', style: TextStyle(color: Colors.lightBlue),),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('Español'),
            ),
          
             SettingsTile.navigation(
              leading: Icon(Icons.cloud_outlined),
              title: Text('Environment'),
              value: Text('Production'),
             
            ),
              SettingsTile.navigation(
             
              leading: Icon(Icons.devices_other),
              title: Text('Platform'),
              value: Text('Default'),
          
             
        
             
            ),

              SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.notifications_on),
              title: Text('Enable notifications'),
             
              
            ),
           SettingsTile(
title: Text('Account', style: TextStyle(color: Colors.lightBlue, fontSize: 15),),
           ),
              SettingsTile.navigation(
              leading: Icon(Icons.phone),
              title: Text('Phone number'),
              
             
            ),
               SettingsTile.navigation(
              leading: Icon(Icons.email),
              title: Text('Email'),
               ),
            
              SettingsTile(
title: Text('Security', style: TextStyle(color: Colors.lightBlue, fontSize: 15),),
           ),
            
              SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.lock),
              title: Text('Change password'),
              ),
              SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: false,
              leading: Icon(Icons.fingerprint),
              title: Text('Use fingerprint'),
              ),
              
            
           
           ],
        ),
        
        
      ],
      
    ),
    
    

      drawer: customDrawerW(),
    );
  }
}
