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
import 'package:flutter_polarbear/constant.dart';
import 'package:flutter_polarbear/util/launch_util.dart';
import 'package:flutter_polarbear/widget/sub_bar_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../../../widget/menu_link_widget.dart';
import '../../../widget/menu_text_widget.dart';

class AboutPage extends StatelessWidget {

  const AboutPage({Key? key}) : super(key: key);

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
          title: S.of(context).about,
          backIcon: 'ic_back.svg',
          backText: S.of(context).settings,
        ),
        const SizedBox(height: 40),
        Image.asset(
          'assets/image/icon.png',
          width: 130,
          height: 130,
        ),
        const SizedBox(height: 26),
        MenuTextWidget(
          text: S.of(context).version,
          desc: XConstant.versionName,
        ),
        const SizedBox(height: 15),
        MenuTextWidget(
          text: S.of(context).mail,
          desc: 'jingcai.wei@163.com',
        ),
        const SizedBox(height: 15),
        MenuLinkWidget(
          text: S.of(context).source,
          desc: 'https://github.com/sky-wei/flutter_polarbear',
          onHandlePress: (url) => LaunchUtil.launchUrl(url),
        ),
      ],
    );
  }

  Future<bool> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      return await launch(url, forceSafariVC: false, forceWebView: false,);
    }
    throw 'Could not launch $url';
  }
}

