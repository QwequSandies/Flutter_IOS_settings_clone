import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IOS Setting',
      home: Settings(),
    );
  }
}

class Settings extends StatelessWidget {
  Widget listItem({
    String label,
    Color color,
    IconData icon,
    Widget trailing,
  }) {
    return ListTile(
      onTap: () {},
      leading: Container(
        width: 30,
        height: 30,
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
      title: Text(label),
      trailing: trailing ?? Icon(Icons.chevron_right),
    );
  }

  Widget groupList({List<Widget> children}) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 20),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: children.length,
        itemBuilder: (context, index) {
          return children[index];
        },
        separatorBuilder: (context, index) {
          return Divider(indent: 74, color: Colors.grey, height: 1);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Settings'),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontSize: 26.0,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          groupList(
            children: [
              listItem(
                label: 'Airplane Mode',
                icon: Icons.airplanemode_active,
                color: Colors.orange,
                trailing: CupertinoSwitch(
                  onChanged: (state) {},
                  value: true,
                ),
              ),
              listItem(
                label: 'Wi-Fi',
                icon: Icons.wifi,
                color: Colors.blue,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Not Connected'),
                    SizedBox(width: 10),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              listItem(
                label: 'Bluetooth',
                icon: Icons.bluetooth,
                color: Colors.blue,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('On'),
                    SizedBox(width: 10),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              listItem(
                label: 'Mobile Data',
                icon: Icons.import_export,
                color: Colors.lightGreenAccent[700],
              ),
              listItem(
                label: 'Personal Hotspot',
                icon: Icons.portable_wifi_off,
                color: Colors.lightGreenAccent[700],
              ),
            ],
          ),
          groupList(
            children: [
              listItem(
                label: 'Notifications',
                icon: CupertinoIcons.news,
                color: Colors.red,
              ),
              listItem(
                label: 'Sound',
                icon: CupertinoIcons.volume_up,
                color: Colors.pink,
              ),
              listItem(
                label: 'Do Not Disturb',
                icon: Icons.brightness_3,
                color: Colors.purple,
              ),
              listItem(
                label: 'Screen Time',
                icon: Icons.hourglass_full,
                color: Colors.purple,
              ),
            ],
          ),
          groupList(
            children: [
              listItem(
                label: 'General',
                icon: CupertinoIcons.settings,
                color: Colors.grey,
              ),
              listItem(
                label: 'Control Centre',
                icon: Icons.swap_horizontal_circle,
                color: Colors.grey,
              ),
              listItem(
                label: 'Display & Brightness',
                icon: Icons.font_download, 
                color: Colors.blue[500],
              ),
              listItem(
                label: 'Accessibilty',
                icon: Icons.accessibility,
                color: Colors.blue[500],
              ),
              listItem(
              label: 'Wallpaper',
              icon: Icons.wallpaper,
              color: Colors.lightBlue[200],
              ),
              listItem(
              label: 'Battery',
              icon: CupertinoIcons.battery_full,
              color: Colors.lightGreenAccent[700],
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
