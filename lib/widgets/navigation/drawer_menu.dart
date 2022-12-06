import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app_state.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Consumer<AppState>(
      builder: ((context, appState, _) => ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(),
                child: appState.loggedIn
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                                'Hello, ${FirebaseAuth.instance.currentUser!.displayName}!',
                                style: const TextStyle(fontSize: 24)),
                            ElevatedButton(
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.pop(context);
                                },
                                child: const Text('Logout'))
                          ])
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hello Guest!',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: (() {
                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/login');
                              }),
                              child: const Text('Sign In'))
                        ],
                      ),
              ),
              appState.loggedIn
                  ? Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.message),
                          title: const Text('Messages'),
                          enabled: true,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/messages');
                          },
                          selected: _selectedIndex == 1 ? true : false,
                        ),
                        ListTile(
                          leading: const Icon(Icons.account_circle),
                          title: const Text('Profile'),
                          enabled: true,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/profile');
                          },
                          selected: _selectedIndex == 2 ? true : false,
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                          enabled: true,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/settings');
                          },
                          selected: _selectedIndex == 3 ? true : false,
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ],
                    )
                  : const SizedBox(),
              const ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('About'),
              ),
            ],
          )),
    ));
  }
}
