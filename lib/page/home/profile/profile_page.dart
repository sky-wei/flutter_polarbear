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
import 'package:flutter_polarbear/widget/menu_text_widget.dart';
import 'package:provider/provider.dart';

import '../../../data/account_manager.dart';
import '../../../data/item/admin_item.dart';
import '../../../generated/l10n.dart';
import '../../../widget/sub_title_widget.dart';
import '../../../widget/text_button_widget.dart';
import 'edit_page.dart';

class NavigatorProfile extends StatelessWidget {

  const NavigatorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const ProfilePage();
        });
      },
    );
  }
}

class ProfilePage extends StatefulWidget {

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late AccountManager _accountManager;
  late AdminItem _admin;


  @override
  void initState() {
    super.initState();

    _accountManager = context.read<AccountManager>();
    _admin = _accountManager.admin;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        SubTitleWidget(title: S.of(context).admin),
        const SizedBox(height: 55),
        MenuTextWidget(
          text: S.of(context).name,
          desc: _admin.name,
        ),
        const SizedBox(height: 15),
        MenuTextWidget(
          text: S.of(context).password,
          desc: '******',
        ),
        const SizedBox(height: 15),
        MenuTextWidget(
          text: S.of(context).desc,
          desc: _admin.desc,
        ),
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerRight,
          child: TextButtonWidget(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const EditProfilePage();
                  }
                )
              );
            },
            icon: 'ic_edit.svg',
            text: S.of(context).edit,
          ),
        )
      ],
    );
  }
}
