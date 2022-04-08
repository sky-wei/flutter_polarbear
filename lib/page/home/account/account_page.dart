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
import 'package:flutter_polarbear/data/item/account_item.dart';
import 'package:flutter_polarbear/page/home/account/edit_page.dart';
import 'package:flutter_polarbear/theme/color.dart';

import '../../../generated/l10n.dart';
import '../../../widget/menu_text_widget.dart';
import '../../../widget/sub_bar_widget.dart';
import '../../../widget/text_button_widget.dart';

class AccountPage extends StatefulWidget {
  
  final AccountItem account;

  const AccountPage({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 35),
        SubBarWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: S.of(context).account,
          backIcon: 'ic_back.svg',
          backText: S.of(context).home,
        ),
        const SizedBox(height: 45),
        MenuTextWidget(
          text: S.of(context).name,
          desc: widget.account.name,
        ),
        const SizedBox(height: 15),
        MenuTextWidget(
          text: S.of(context).password,
          desc: widget.account.password,
        ),
        const SizedBox(height: 15),
        MenuTextWidget(
          text: S.of(context).url,
          desc: widget.account.url,
        ),
        const SizedBox(height: 15),
        MenuTextWidget(
          text: S.of(context).desc,
          desc: widget.account.desc,
        ),
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButtonWidget(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) {
                            return EditAccountPage(account: widget.account);
                          }
                      )
                  );
                },
                icon: 'ic_edit.svg',
                text: S.of(context).edit,
              ),
              const SizedBox(width: 30),
              TextButtonWidget(
                onPressed: () {

                },
                icon: 'ic_delete.svg',
                text: S.of(context).delete,
                color: XColor.themeColor,
              ),
            ],
          )
        )
      ],
    );
  }
}
