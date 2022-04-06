/*
 * Copyright (c) 2022 The sky Authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter_polarbear/data/item/side_item.dart';
import 'package:flutter_polarbear/data/item/side_title.dart';
import 'package:flutter_polarbear/page/home/account/list_page.dart';
import 'package:flutter_polarbear/page/home/profile/profile_page.dart';
import 'package:flutter_polarbear/page/home/settings/setting_page.dart';
import 'package:flutter_polarbear/page/home/side_scaffold.dart';

import 'create/create_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SideScaffold(
      sideTitle: SideTitle(
        icon: 'assets/image/icon.png',
        name: 'Account Manage'
      ),
      sideItems: [
        SideItem(
          icon: 'ic_home.svg',
          name: 'Home',
        ),
        SideItem(
          icon: 'ic_profile.svg',
          name: 'Profile',
        ),
        SideItem(
          icon: 'ic_create.svg',
          name: 'New',
        ),
        SideItem(
          icon: 'ic_settings.svg',
          name: 'Settings',
        ),
      ],
      currentIndex: _currentIndex,
      body: _pageAtIndex(_currentIndex),
      onNavigationIndexChange: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget _pageAtIndex(int index) {
    switch(index) {
      case 0:
        return const AccountListPage();
      case 1:
        return Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (context) {
              return const ProfilePage();
            });
          },
        );
      case 2:
        return const NewAccountPage();
      case 3:
        return Navigator(
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (context) {
              return const SettingPage();
            });
          },
        );
      default:
        return Center(
          child: Text("Index: $index"),
        );
    }
  }
}

