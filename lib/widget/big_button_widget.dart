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

class BigButtonWidget extends StatelessWidget {

  final VoidCallback? onPressed;
  final String text;

  const BigButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
            const Size(310, 63)
        ),
        textStyle: MaterialStateProperty.all(
            const TextStyle(
                fontFamily: 'hwxw',
                fontSize: 18
            )
        ),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))
          )
        )
      ),
      child: Text(text),
    );
  }
}
