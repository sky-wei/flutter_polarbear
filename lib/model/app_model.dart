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
import 'package:flutter_polarbear/util/easy_notifier.dart';

import '../data/account_manager.dart';
import '../data/item/account_item.dart';
import '../data/item/admin_item.dart';
import '../data/objectbox.dart';

abstract class AbstractModel extends EasyNotifier {}

class AppModel extends AbstractModel {

  final BuildContext context;

  bool _init = false;
  late AccountManager _accountManager;

  AdminItem _admin = AdminItem.empty;
  List<AccountItem> _accountList = [];

  // 获取管理员信息
  AdminItem get admin => _admin;
  List<AccountItem> get accountList => _accountList;

  AppModel({ required this.context });

  /// 初始化
  Future<AppModel> initialize() async {
    if (!_init) {
      _init = true;
      _accountManager = AccountManager(
        objectBox: await ObjectBox.create()
      );
    }
    return this;
  }

  /// 是否注册管理员账号
  bool isRegisterAdmin() {
    return _accountManager.isRegisterAdmin();
  }

  /// 创建账号
  Future<AdminItem> createAdmin({
    required String name,
    required String password
  }) async {

    var item = _accountManager.encryptAdmin(
      AdminItem(
        name: name,
        password: password,
        createTime: DateTime.now().millisecondsSinceEpoch
      )
    );

    _updateAdmin(await _accountManager.createAdmin(item));

    return _admin;
  }

  // /// 更新管理员信息
  // Future<AdminItem> updateAdmin(AdminItem item) async {
  //
  //   var updateItem = AdminMapper.transformItem(item);
  //   var result = adminBox.put(updateItem, mode: PutMode.update);
  //
  //   if (result <= 0) {
  //     throw DataException.type(type: ErrorType.updateError);
  //   }
  //
  //   return item;
  // }

  /// 登录账号
  Future<AdminItem> loginByAdmin({
    required String name,
    required String password
  }) async {

    var item = _accountManager.encryptAdmin(
        AdminItem(name: name, password: password)
    );

    _updateAdmin(await _accountManager.loginByAdmin(item));

    return _admin;
  }

  /// 登录账号
  Future<List<AccountItem>> loadAccountList() async {

    _updateAccountList(await _accountManager.loadByAdmin(_admin));

    return _accountList;
  }

  /// 搜索账号
  Future<List<AccountItem>> searchAccount(String keyword) async {
    return [];
  }

  /// 清除数据
  Future<bool> clearData() async {
    return await _accountManager.clearData(_admin);
  }

  /// 创建账号
  Future<AccountItem> createAccount({
    required String name, required String password,
    required String url, required String desc
  }) async {

    var item = _accountManager.encryptAccount(
      AccountItem(
        name: name,
        adminId: admin.id,
        password: password,
        url: url,
        desc: desc,
        createTime: DateTime.now().millisecondsSinceEpoch
      )
    );

    return _accountManager.createAccount(item);
  }

  /// 更新账号信息
  Future<AccountItem> updateAccount(AccountItem item) async {
    return item;
  }

  /// 删除账号
  Future<AccountItem> deleteAccount(AccountItem item) async {
    return item;
  }

  /// 更新管理员信息
  void _updateAdmin(AdminItem item) {
    notify(() => _admin = item);
  }

  /// 更新列表信息
  void _updateAccountList(List<AccountItem> items) {
    notify(() {
      _accountList.clear();
      _accountList.addAll(items);
    });
  }
}

