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
import 'package:flutter_polarbear/model/app_model.dart';
import 'package:flutter_polarbear/widget/big_title_widget.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../route.dart';
import '../../util/error_util.dart';
import '../../util/message_util.dart';
import '../../widget/big_button_widget.dart';
import '../../widget/big_input_widget.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState()=> _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              BigTitleWidget(title: S.of(context).welcome),
              const SizedBox(height: 60),
              BigInputWidget(
                controller: _nameController,
                iconName: 'ic_user.svg',
                labelText: S.of(context).name,
                autofocus: true,
                textInputAction: TextInputAction.next,
                validator: (v) {
                  return v!.trim().isEmpty ? S.of(context).nameNotEmpty : null;
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
                  return v!.trim().isEmpty ? S.of(context).passwordNotEmpty : null;
                },
                onFieldSubmitted: (value) => _login(),
              ),
              const SizedBox(height: 40),
              BigButtonWidget(
                onPressed: () => _login(),
                text: S.of(context).login,
              )
            ],
          ),
        )
      ),
    );
  }

  void _login() {

    if (!(_formKey.currentState as FormState).validate()) {
      return;
    }

    var name = _nameController.text;
    var password = _passwordController.text;

    var appModel = context.read<AppModel>();

    appModel.loginByAdmin(
      name: name, password: password
    ).then((value) {
      Navigator.pushReplacementNamed(context, XRoute.home);
    }).onError((error, stackTrace) {
      MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
    });
  }
}
