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
import 'package:flutter_svg/svg.dart';

import '../theme/color.dart';

class TextButtonWidget extends StatelessWidget {

  final VoidCallback? onPressed;
  final String text;
  final String icon;
  final Color color;

  const TextButtonWidget({
    Key? key,
    this.onPressed,
    required this.text,
    required this.icon,
    this.color = XColor.black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.fromLTRB(10, 15, 10, 15)
        ),
      ),
      icon: SvgPicture.asset(
        'assets/svg/$icon',
        color: color,
        width: 24,
        height: 24,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: color
        ),
      )
    );
  }
}
