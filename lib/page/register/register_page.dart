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
import 'package:flutter_polarbear/data/account_manager.dart';
import 'package:flutter_polarbear/data/item/admin_item.dart';
import 'package:flutter_polarbear/route.dart';
import 'package:flutter_polarbear/util/error_util.dart';
import 'package:flutter_polarbear/util/message_util.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../widget/big_button_widget.dart';
import '../../widget/big_input_widget.dart';
import '../../widget/big_title_widget.dart';


class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState()=> _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BigTitleWidget(title: "Welcome"),
                const SizedBox(height: 60),
                BigInputWidget(
                  controller: _nameController,
                  iconName: 'ic_user.svg',
                  labelText: S.of(context).name,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    return v!.trim().isEmpty ? "名称不能为空!" : null;
                  },
                ),
                const SizedBox(height: 20),
                BigInputWidget(
                  controller: _passwordController,
                  iconName: 'ic_password.svg',
                  labelText: S.of(context).password,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return "密码不能为空!";
                    } else if (v != _confirmPasswordController.text) {
                      return "密码输入不一致";
                    }
                  },
                ),
                const SizedBox(height: 20),
                BigInputWidget(
                  controller: _confirmPasswordController,
                  iconName: 'ic_password.svg',
                  labelText: S.of(context).confirmPassword,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v!.trim().isEmpty) {
                      return "密码不能为空!";
                    } else if (v != _confirmPasswordController.text) {
                      return "密码输入不一致";
                    }
                  },
                  onFieldSubmitted: (value) => _register(),
                ),
                const SizedBox(height: 40),
                BigButtonWidget(
                  onPressed: () => _register(),
                  text: S.of(context).register,
                )
              ],
            ),
          )
      ),
    );
  }
  
  void _register() {

    if (!(_formKey.currentState as FormState).validate()) {
      return;
    }

    var name = _nameController.text;
    var password = _passwordController.text;

    var accountManager = context.read<AccountManager>();

    accountManager.createAdmin(
      accountManager.encryptAdmin(
        AdminItem(name: name, password: password)
      )
    ).then((value) {
      accountManager.updateInfo(value);
      Navigator.pushReplacementNamed(context, XRoute.home);
    }).onError((error, stackTrace) {
      MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
    });
  }
}

