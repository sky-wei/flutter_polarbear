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
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../util/error_util.dart';
import '../../../util/message_util.dart';
import '../../../widget/bear_animate_widget.dart';
import '../../../widget/big_button_widget.dart';
import '../../../widget/big_input_widget.dart';
import '../../../widget/sub_title_widget.dart';

class NavigatorNewAccount extends StatelessWidget {

  const NavigatorNewAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NewAccountPage();
  }
}

class NewAccountPage extends StatefulWidget {

  const NewAccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> with SingleTickerProviderStateMixin {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 260),
      vsync: this
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BearAnimateWidget(
      animation: _animationController,
      child: Column(
        children: [
          const SizedBox(height: 45),
          SubTitleWidget(title: S.of(context).account),
          Expanded(
            child: _buildNewAccount(),
          )
        ],
      ),
    );
  }

  Widget _buildNewAccount() {
    return Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
              ),
              const SizedBox(height: 20),
              BigInputWidget(
                controller: _urlController,
                iconName: 'ic_url.svg',
                labelText: S.of(context).url,
                textInputAction: TextInputAction.next,
                validator: (v) {
                  return v!.trim().isEmpty ? S.of(context).urlNotEmpty : null;
                },
              ),
              const SizedBox(height: 20),
              BigInputWidget(
                controller: _descController,
                iconName: 'ic_desc.svg',
                labelText: S.of(context).desc,
                validator: (v) {
                  return v!.trim().isEmpty ? S.of(context).descNotEmpty : null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: 2,
              ),
              const SizedBox(height: 40),
              BigButtonWidget(
                onPressed: () => _createAccount(),
                text: S.of(context).create,
              )
            ],
          ),
        )
    );
  }

  void _createAccount() {

    if (!(_formKey.currentState as FormState).validate()) {
      return;
    }

    var name = _nameController.text;
    var password = _passwordController.text;
    var url = _urlController.text;
    var desc = _descController.text;

    var appModel = context.read<AppModel>();

    appModel.createAccount(
      name: name,
      password: password,
      url: url,
      desc: desc
    ).then((value) {
      _clearText();
      MessageUtil.showMessage(context, S.of(context).createAccountSuccess);
    }).onError((error, stackTrace) {
      MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
    });
  }

  void _clearText() {
    _nameController.clear();
    _passwordController.clear();
    _urlController.clear();
    _descController.clear();
  }
}
