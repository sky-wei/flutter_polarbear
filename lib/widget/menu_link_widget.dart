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

import '../theme/color.dart';

class MenuLinkWidget extends StatelessWidget {

  final ValueChanged<String>? onHandlePress;
  final String text;
  final String desc;

  const MenuLinkWidget({
    Key? key,
    this.onHandlePress,
    required this.text,
    required this.desc
  }) : super(key: key);

  void _handlePress() {
    if (onHandlePress != null) {
      onHandlePress!(desc);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: XColor.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 28, top: 24, right: 28, bottom: 24
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 16,
                      color: XColor.black
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Text(
                      desc,
                      style: const TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: XColor.grayColor
                      ),
                    ),
                    onTap: _handlePress,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

