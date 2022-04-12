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

class BearPageRoute extends PageRouteBuilder {

  final WidgetBuilder builder;

  BearPageRoute({required this.builder}) :
    super(
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {

        var curvedAnimation = CurvedAnimation(
          parent: animation, curve: Curves.easeOut
        );
        var tween = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0)
        ).animate(curvedAnimation);

        return SlideTransition(
          position: tween,
          child: child,
        );
      }
    );
}
