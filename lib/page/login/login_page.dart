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
import 'package:flutter_polarbear/widget/big_title_widget.dart';

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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const BigTitleWidget(title: "Welcome"),
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
              const SizedBox(height: 30),
              BigButtonWidget(
                onPressed: () {
                  if ((_formKey.currentState as FormState).validate()) {

                  }
                },
                text: 'Login',
              )
            ],
          ),
        )
      ),
    );
  }
}
