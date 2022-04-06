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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polarbear/page/home/settings/about_page.dart';
import 'package:flutter_polarbear/widget/menu_more_widget.dart';
import 'package:flutter_polarbear/widget/sort_title_widget.dart';

class SettingPage extends StatefulWidget {

  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 45),
        const SortTitleWidget(title: 'Account'),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () {

          },
          text: 'Import',
          icon: 'ic_arrow_right.svg'
        ),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () {

          },
          text: 'Export',
          icon: 'ic_arrow_right.svg'
        ),
        const SizedBox(height: 30),
        const SortTitleWidget(title: 'Storage'),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () {

          },
          text: 'Clear Data',
          icon: 'ic_arrow_right.svg'
        ),
        const SizedBox(height: 30),
        const SortTitleWidget(title: 'Other'),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const AboutPage();
                }
              )
            );
          },
          text: 'About',
          icon: 'ic_arrow_right.svg'
        ),
      ],
    );
  }
}

