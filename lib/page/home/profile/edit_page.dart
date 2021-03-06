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
import 'package:flutter_polarbear/data/item/admin_item.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../model/app_model.dart';
import '../../../util/error_util.dart';
import '../../../util/message_util.dart';
import '../../../widget/big_button_widget.dart';
import '../../../widget/big_input_widget.dart';
import '../../../widget/sub_bar_widget.dart';

class EditProfilePage extends StatefulWidget {

  final AdminItem admin;

  const EditProfilePage({
    Key? key,
    required this.admin,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfilePage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.admin.name;
    _descController.text = widget.admin.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 35),
        SubBarWidget(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: S.of(context).edit,
          backIcon: 'ic_back.svg',
          backText: S.of(context).admin,
        ),
        Expanded(
          child: _buildEditAccount(),
        )
      ],
    );
  }

  Widget _buildEditAccount() {
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
                controller: _newPasswordController,
                iconName: 'ic_password.svg',
                labelText: S.of(context).newPassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
                validator: (v) {
                  return v!.trim().isEmpty ? S.of(context).newPasswordNotEmpty : null;
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
                onPressed: () => _changeAdmin(),
                text: S.of(context).change,
              )
            ],
          ),
        )
    );
  }

  /// ?????????????????????
  void _changeAdmin() {

    if (!(_formKey.currentState as FormState).validate()) {
      return;
    }

    var name = _nameController.text;
    var password = _passwordController.text;
    var newPassword = _newPasswordController.text;
    var desc = _descController.text;

    var appModel = context.read<AppModel>();

    appModel.updateAdmin(
      name: name,
      password: password,
      newPassword: newPassword,
      desc: desc
    ).then((value) {
      Navigator.pop(context, true);
    }).onError((error, stackTrace) {
      MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
    });
  }
}
