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

class MenuTextWidget extends StatelessWidget {

  final VoidCallback? onPressed;
  final ValueChanged<String>? onCopyPress;
  final String text;
  final String desc;

  const MenuTextWidget({
    Key? key,
    this.onPressed,
    this.onCopyPress,
    required this.text,
    required this.desc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var right = onCopyPress == null ? 28.0 : 20.0;
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: XColor.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.only(
                left: 28, top: 24, right: right, bottom: 24
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SelectableText(
                        desc,
                        style: const TextStyle(
                          fontSize: 16,
                          color: XColor.grayColor
                        ),
                      ),
                      if (onCopyPress != null)
                        IconButton(
                          onPressed: () => onCopyPress!(desc),
                          icon: SvgPicture.asset(
                            'assets/svg/ic_copy.svg',
                            color: XColor.black,
                            width: 24,
                            height: 24
                          ),
                        )
                    ],
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

