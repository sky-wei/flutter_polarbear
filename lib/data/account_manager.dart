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

import 'package:flutter_polarbear/data/item/account_item.dart';
import 'package:flutter_polarbear/data/item/admin_item.dart';
import 'package:flutter_polarbear/data/mapper/account_mapper.dart';
import 'package:flutter_polarbear/data/mapper/admin_mapper.dart';
import 'package:flutter_polarbear/data/objectbox.dart';

import 'data_exception.dart';
import 'entity/account_entity.dart';
import 'entity/admin_entity.dart';
import 'objectbox.g.dart';

class AccountManager {

  final ObjectBox objectBox;

  Box<AdminEntity> get adminBox => objectBox.adminBox;
  Box<AccountEntity> get accountBox => objectBox.accountBox;

  AccountManager({ required this.objectBox });

  /// 是否注册管理员账号
  bool isRegisterAdmin() {
    return adminBox.isEmpty();
  }

  /// 创建账号
  Future<AdminItem> createAdmin(AdminItem item) async {

    var entity = adminBox
        .query(AdminEntity_.name.equals(item.name))
        .build()
        .findFirst();

    if (entity != null) {
      throw DataException.type(type: ErrorType.adminExist);
    }

    var id = adminBox.put(AdminMapper.transformItem(item));

    return item.copy(id: id);
  }

  /// 登录账号
  Future<AdminItem> loginByAdmin(AdminItem item) async {

    var entity = adminBox
        .query(AdminEntity_.name.equals(item.name))
        .build()
        .findFirst();

    if (entity == null) {
      throw DataException.type(type: ErrorType.nameOrPasswordError);
    }

    if (entity.password != item.password) {
      throw DataException.type(type: ErrorType.nameOrPasswordError);
    }

    return AdminMapper.transformEntity(entity);
  }

  /// 登录账号
  Future<List<AccountItem>> loadByAdmin(AdminItem item) async {
    
    var queryBuilder = accountBox
      .query(AccountEntity_.adminId.equals(item.id))
      ..order(AccountEntity_.createTime, flags: Order.descending);
    
    return AccountMapper.transformEntities(
        queryBuilder.build().find()
    );
  }

  /// 搜索账号
  Future<List<AccountItem>> searchAccount(int adminId, String keyword) async {

    var queryBuilder = accountBox
      .query(AccountEntity_.adminId.equals(adminId).and(AccountEntity_.desc.contains(keyword)))
      ..order(AccountEntity_.createTime, flags: Order.descending);

    return AccountMapper.transformEntities(
        queryBuilder.build().find()
    );
  }

  /// 创建账号
  Future<AccountItem> createAccount(AccountItem item) async {
    var id = accountBox.put(AccountMapper.transformItem(item));
    return item.copy(id: id);
  }

  /// 更新账号信息
  Future<AccountItem> updateAccount(AccountItem item) async {

    var result = accountBox.put(
        AccountMapper.transformItem(item), mode: PutMode.update
    );

    if (result <= 0) {
      throw DataException.type(type: ErrorType.updateError);
    }
    return item;
  }

  /// 更新账号信息
  Future<List<AccountItem>> updateByAdmin(AdminItem item, List<AccountItem> items) async {

    var entity = adminBox
      .query(AdminEntity_.name.equals(item.name))
      .build()
      .findFirst();
    
    if (entity == null) {
      throw DataException.type(type: ErrorType.updateError);
    }
    
    await _updateAdmin(item);

    for (var element in items) {
      await updateAccount(element);
    }
    
    return items;
  }

  /// 删除账号
  Future<AccountItem> deleteAccount(AccountItem item) async {
    if (!accountBox.remove(item.id)) {
      throw DataException.type(type: ErrorType.deleteError);
    }
    return item;
  }

  /// 清除数据
  Future<bool> clearData(AdminItem item) async {
    accountBox
        .query(AccountEntity_.adminId.equals(item.id))
        .build()
        .remove();
    return true;
  }

  AdminItem encryptAdmin(AdminItem item) {
    return item;
  }

  AdminItem decryptAdmin(AdminItem item) {
    return item;
  }

  AccountItem encryptAccount(AccountItem item) {
    return item;
  }

  AccountItem decryptAccount(AccountItem item) {
    return item;
  }

  /// 更新管理员信息
  Future<AdminItem> _updateAdmin(AdminItem item) async {

    var updateItem = AdminMapper.transformItem(item);
    var result = adminBox.put(updateItem, mode: PutMode.update);

    if (result <= 0) {
      throw DataException.type(type: ErrorType.updateError);
    }

    return item;
  }
}


