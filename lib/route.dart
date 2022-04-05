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
import 'package:flutter_polarbear/page/home/home_page.dart';
import 'package:flutter_polarbear/page/login/login_page.dart';
import 'package:flutter_polarbear/page/register/register_page.dart';
import 'package:flutter_polarbear/page/splash/splash_page.dart';
import 'package:flutter_polarbear/util/log.dart';

class XRoute {

  XRoute._();

  static const String splash = "/splash";

  static const String login = "/login";

  static const String register = "/register";

  static const String home = "/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {

    XLog.d('generateRoute $settings');

    Route<dynamic>? route;

    switch(settings.name) {
      case splash:
        route = MaterialPageRoute(
            builder: (context) {
              return const SplashPage();
            }
        );
        break;
      case login:
        route = MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            }
        );
        break;
      case register:
        route = MaterialPageRoute(
            builder: (context) {
              return const RegisterPage();
            }
        );
        break;
      case home:
        route = MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            }
        );
        break;
      default:
        route = MaterialPageRoute(
            builder: (context) {
              return const LoginPage();
            }
        );
        break;
    }

    return route;
  }
}

