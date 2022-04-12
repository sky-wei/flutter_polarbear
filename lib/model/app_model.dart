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

import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter_polarbear/data/data_exception.dart';
import 'package:flutter_polarbear/util/easy_notifier.dart';
import 'package:path_provider/path_provider.dart';

import '../data/account_manager.dart';
import '../data/item/account_item.dart';
import '../data/item/admin_item.dart';
import '../data/objectbox.dart';
import '../generated/l10n.dart';

abstract class AbstractModel extends EasyNotifier {}

class AppModel extends AbstractModel {

  // final BuildContext context;

  bool _init = false;
  late AccountManager _accountManager;

  AdminItem _admin = AdminItem.empty;
  // List<AccountItem> _accountList = [];

  // 获取管理员信息
  AdminItem get admin => _admin;
  // List<AccountItem> get accountList => _accountList;

  AppModel();

  /// 初始化
  Future<AppModel> initialize() async {
    if (!_init) {
      _init = true;
      final dir = await getApplicationSupportDirectory();
      _accountManager = AccountManager(
        objectBox: await ObjectBox.create(directory: dir.path)
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

    var admin = await _accountManager.createAdmin(item);

    return _updateAdmin(admin.copy(password: password));
  }

  /// 更新管理员信息
  Future<AdminItem> updateAdmin({
    required String name,
    required String password,
    required String newPassword,
    required String desc,
  }) async {

    if (password != _admin.password) {
      throw DataException.type(type: ErrorType.passwordError);
    }

    // 先解密账号
    List<AccountItem> list = await _accountManager.loadByAdmin(_admin);
    list = list.map((item) => _accountManager.decryptAccount(_admin, item)).toList();

    // 新的管理信息
    var newAdmin = _admin.copy(name: name, password: newPassword, desc: desc);

    // 加密账号
    list = list.map((item) => _accountManager.encryptAccount(newAdmin, item)).toList();

    // 更新信息
    await _accountManager.updateByAdmin(_accountManager.encryptAdmin(newAdmin), list);

    return _updateAdmin(newAdmin);
  }

  /// 登录账号
  Future<AdminItem> loginByAdmin({
    required String name,
    required String password
  }) async {

    var item = _accountManager.encryptAdmin(
        AdminItem(name: name, password: password)
    );

    var admin = await _accountManager.loginByAdmin(item);

    return _updateAdmin(admin.copy(password: password));
  }

  /// 登录账号
  Future<List<AccountItem>> loadAccountList() async {
    return await _accountManager.loadByAdmin(_admin);
  }

  /// 搜索账号
  Future<List<AccountItem>> searchAccount(String keyword) async {
    return await _accountManager.searchAccount(_admin, keyword);
  }

  /// 导入账号
  Future<bool> importAccount() async {

    var file = await openFile(
        acceptedTypeGroups: [XTypeGroup(label: 'json', extensions: ['json'])],
        confirmButtonText: S.current.import
    );

    if (file == null) return false;

    var text = await file.readAsString();
    var values = json.decode(text) as List;

    var list = values.map((e) => AccountItem.fromJson(e)).toList();
    list.sort((a, b) => a.id.compareTo(b.id));

    var count = 0;

    list = list.map((e) {
      return _accountManager.encryptAccount(
        _admin, e
      ).copy(
        id: 0,
        adminId: _admin.id,
        createTime: DateTime.now().millisecondsSinceEpoch + (count++)
      );
    }).toList();

    // 批量导入
    _accountManager.createAccountList(list);
    return true;
  }

  /// 导出账号
  Future<bool> exportAccount() async {

    var path = await getSavePath(
        acceptedTypeGroups: [XTypeGroup(label: 'json', extensions: ['json'])],
        suggestedName: "account_list.json",
        confirmButtonText: S.current.export
    );

    if (path == null) return false;

    var list = await _accountManager.loadByAdmin(_admin);
    list = list.map((e) => _accountManager.decryptAccount(_admin, e)).toList();

    var text = json.encode(list);
    await File(path).writeAsString(text, flush: true);
    return true;
  }

  /// 清除数据
  Future<bool> clearData() async {
    return await _accountManager.clearData(_admin);
  }

  /// 清除所有数据
  Future<bool> clearAllData() async {
    return await _accountManager.clearAllData();
  }

  /// 创建账号
  Future<AccountItem> createAccount({
    required String name, required String password,
    required String url, required String desc
  }) async {

    var item = _accountManager.encryptAccount(
      _admin,
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
    return _accountManager.updateAccount(
      _accountManager.encryptAccount(_admin, item)
    );
  }

  /// 删除账号
  Future<AccountItem> deleteAccount(AccountItem item) async {
    return _accountManager.deleteAccount(item);
  }

  /// 解密账号
  AccountItem decryptAccount(AccountItem account) {
    return _accountManager.decryptAccount(_admin, account);
  }

  /// 更新管理员信息
  AdminItem _updateAdmin(AdminItem item) {
    notify(() => _admin = item);
    return item;
  }

  // /// 更新列表信息
  // void _updateAccountList(List<AccountItem> items) {
  //   notify(() {
  //     _accountList.clear();
  //     _accountList.addAll(items);
  //   });
  // }
}

