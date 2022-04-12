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

class AccountItem {

  static final AccountItem empty = AccountItem(name: '', adminId: 0, password: '');

  final int id;
  final int adminId;
  final String name;
  final String password;
  final String url;
  final String desc;
  final int createTime;

  AccountItem({
    this.id = 0,
    required this.name,
    required this.adminId,
    required this.password,
    this.url = '',
    this.desc = '',
    this.createTime = 0
  });

  AccountItem copy({
    int? id,
    int? adminId,
    String? name,
    String? password,
    String? url,
    String? desc,
    int? createTime
  }) {
    return AccountItem(
        id: id ?? this.id,
        adminId: adminId ?? this.adminId,
        name: name ?? this.name,
        password: password ?? this.password,
        url: url ?? this.url,
        desc: desc ?? this.desc,
        createTime: createTime ?? this.createTime
    );
  }

  factory AccountItem.fromJson(Map<String, dynamic> json) => AccountItem(
    id: json['id'],
    adminId: json['adminId'],
    name: json['name'],
    password: json['password'],
    url: json['url'],
    desc: json['desc'],
    createTime: json['createTime']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'adminId': adminId,
    'name': name,
    'password': password,
    'url': url,
    'desc': desc,
    'createTime': createTime
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          adminId == other.adminId;

  @override
  int get hashCode => id.hashCode ^ adminId.hashCode;

  @override
  String toString() {
    return 'AccountItem{id: $id, adminId: $adminId, name: $name, password: $password, url: $url, desc: $desc, createTime: $createTime}';
  }
}
