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
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_polarbear/data/account_manager.dart';
import 'package:flutter_polarbear/model/app_model.dart';
import 'package:flutter_polarbear/page/home/home_page.dart';
import 'package:flutter_polarbear/page/login/login_page.dart';
import 'package:flutter_polarbear/page/register/register_page.dart';
import 'package:flutter_polarbear/page/splash/splash_page.dart';
import 'package:flutter_polarbear/route.dart';
import 'package:flutter_polarbear/theme/theme.dart';
import 'package:flutter_polarbear/util/log_util.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppModel()),
      ],
      child: MaterialApp(
        title: 'PolarBear',
        theme: XTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        routes: {
          XRoute.splash: (BuildContext context) => const SplashPage(),
          XRoute.login: (BuildContext context) => const LoginPage(),
          XRoute.register: (BuildContext context) => const RegisterPage(),
          XRoute.home: (BuildContext context) => const HomePage(),
        },
        initialRoute: XRoute.splash,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        navigatorObservers: [_MyNavigatorObserver()],
      ),
    );
  }
}

class _MyNavigatorObserver extends NavigatorObserver {

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    XLog.d('>>>>>>>>>>>> didPush $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    XLog.d('>>>>>>>>>>>> didPop $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    XLog.d('>>>>>>>>>>>> didRemove $route');
  }
}
