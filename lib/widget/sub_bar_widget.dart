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
import 'package:flutter_polarbear/widget/text_button_widget.dart';

import '../theme/color.dart';

class SubBarWidget extends StatelessWidget {

  final VoidCallback? onPressed;
  final String title;
  final String backIcon;
  final String backText;

  const SubBarWidget({
    Key? key,
    this.onPressed,
    required this.title,
    required this.backIcon,
    required this.backText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextButtonWidget(
            onPressed: onPressed,
            icon: backIcon,
            text: backText,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: XColor.black,
            ),
          ),
        )
      ],
    );
  }
}