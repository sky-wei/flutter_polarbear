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
import 'package:flutter_polarbear/model/app_model.dart';
import 'package:flutter_polarbear/page/home/settings/about_page.dart';
import 'package:flutter_polarbear/widget/menu_more_widget.dart';
import 'package:flutter_polarbear/widget/sort_title_widget.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../util/error_util.dart';
import '../../../util/message_util.dart';

class NavigatorSetting extends StatelessWidget {

  const NavigatorSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const SettingPage();
        });
      },
    );
  }
}

class SettingPage extends StatefulWidget {

  const SettingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  late AppModel _appModel;

  @override
  void initState() {
    super.initState();
    _appModel = context.read<AppModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 45),
        SortTitleWidget(title: S.of(context).account),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () {

          },
          text: S.of(context).import,
          icon: 'ic_arrow_right.svg'
        ),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () {

          },
          text: S.of(context).export,
          icon: 'ic_arrow_right.svg'
        ),
        const SizedBox(height: 30),
        SortTitleWidget(title: S.of(context).storage),
        const SizedBox(height: 15),
        MenuMoreWidget(
          onPressed: () => _clearData(),
          text: S.of(context).clearData,
          icon: 'ic_arrow_right.svg'
        ),
        const SizedBox(height: 30),
        SortTitleWidget(title: S.of(context).other),
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
          text: S.of(context).about,
          icon: 'ic_arrow_right.svg'
        ),
      ],
    );
  }

  /// 清除数据
  void _clearData() {
    _appModel.clearData(
    ).then((value) {
      MessageUtil.showMessage(context, '清除数据完成！');
    }).onError((error, stackTrace) {
      MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
    });
  }
}

