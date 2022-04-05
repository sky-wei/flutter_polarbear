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

import '../../../widget/big_button_widget.dart';
import '../../../widget/big_input_widget.dart';
import '../../../widget/big_title_widget.dart';
import '../../../widget/sub_title_widget.dart';

class NewAccountPage extends StatefulWidget {

  const NewAccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 45),
        const SubTitleWidget(title: 'Account'),
        Expanded(
          child: Center(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    BigInputWidget(
                      controller: _nameController,
                      iconName: 'ic_user.svg',
                      labelText: 'Name',
                      autofocus: true,
                      validator: (v) {
                        return v!.trim().isEmpty ? "名称不能为空!" : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BigInputWidget(
                      controller: _passwordController,
                      iconName: 'ic_password.svg',
                      labelText: 'Password',
                      obscureText: true,
                      validator: (v) {
                        return v!.trim().isEmpty ? "密码不能为空!" : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BigInputWidget(
                      controller: _urlController,
                      iconName: 'ic_url.svg',
                      labelText: 'Url',
                      autofocus: true,
                      validator: (v) {
                        return v!.trim().isEmpty ? "URL不能为空!" : null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BigInputWidget(
                      controller: _descController,
                      iconName: 'ic_desc.svg',
                      labelText: 'Description',
                      autofocus: true,
                      validator: (v) {
                        return v!.trim().isEmpty ? "描述不能为空!" : null;
                      },
                    ),
                    const SizedBox(height: 30),
                    BigButtonWidget(
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {

                        }
                      },
                      text: 'Create',
                    )
                  ],
                ),
              )
          ),
        )
      ],
    );
  }
}
