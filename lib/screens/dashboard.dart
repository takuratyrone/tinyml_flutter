import 'package:flutter/material.dart';
import 'package:tsa_tinyml/constants/constant.dart';
import 'package:tsa_tinyml/screens/bluetooth/bluetooth_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      drawer: NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  [
            Text(
              'DASHBOARD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0
              ),
            ),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('A card that can be tapped')),
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('A card that can be tapped')),
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('A card that can be tapped')),
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: const SizedBox(
                      width: 300,
                      height: 100,
                      child: Center(child: Text('A card that can be tapped')),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
  Widget buildHeader(BuildContext context) {
    return Container(

    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bluetooth_outlined),
            title: Text('Bluetooth'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BluetoothPage(),
                  )
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.thermostat_outlined),
            title: Text('Temperature'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.water_drop_outlined),
            title: Text('Humidity'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.wind_power_outlined),
            title: Text('Pressure'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.air_outlined),
            title: Text('Air Quality'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


