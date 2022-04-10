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
import 'package:flutter_polarbear/data/item/account_item.dart';
import 'package:flutter_polarbear/page/home/account/account_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../data/account_manager.dart';
import '../../../generated/l10n.dart';
import '../../../theme/color.dart';
import '../../../util/error_util.dart';
import '../../../util/message_util.dart';
import '../../../widget/big_search_widget.dart';

class NavigatorAccountList extends StatelessWidget {

  final VoidCallback? onNewPressed;

  const NavigatorAccountList({
    Key? key,
    this.onNewPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return AccountListPage(onNewPressed: onNewPressed);
        });
      },
    );
  }
}

class AccountListPage extends StatefulWidget {

  final VoidCallback? onNewPressed;

  const AccountListPage({
    Key? key,
    this.onNewPressed
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {

  late AccountManager _accountManager;
  final List<AccountItem> _accountItems = [];

  @override
  void initState() {
    super.initState();
    
    _accountManager = context.read<AccountManager>();
    _accountManager.loadByAdmin(_accountManager.admin).then((value) {
      setState(() {
        _accountItems.clear();
        _accountItems.addAll(value);
      });
    }).onError((error, stackTrace) {
      MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        BigSearchWidget(
          iconName: 'ic_search.svg',
          labelText: S.of(context).search,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 30),
        Expanded(
          child: _buildAccountList(),
        ),
      ],
    );
  }

  Widget _buildAccountList() {

    if (_accountItems.isEmpty) {
      return _buildAccountEmpty(widget.onNewPressed);
    }

    return ListView.separated(
      itemCount: _accountItems.length,
      itemBuilder: (context, index) {
        return _buildAccountItem(
          _accountItems[index],
          (item) => _handlerAccount(item)
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
    );
  }

  void _handlerAccount(AccountItem item) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return AccountPage(account: item);
          }
      )
    ).then((value) => {
      if (value != null) {
        _handlerResult(value as ActionResult)
      }
    });
  }
  
  void _handlerResult(ActionResult result) {
    switch(result.action) {
      case AccountAction.delete:
        _accountManager.deleteAccount(result.item).then((value) {
          setState(() {
            _accountItems.remove(value);
          });
          MessageUtil.showMessage(context, '删除账号成功！');
        }).onError((error, stackTrace) {
          MessageUtil.showMessage(context, ErrorUtil.getMessage(context, error));
        });
        break;
      case AccountAction.update:
        // TODO: Handle this case.
        break;
    }
  }

  Widget _buildAccountEmpty(VoidCallback? onPressed) {
    return Center(
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 28, top: 24, right: 28, bottom: 24
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                      'assets/svg/ic_empty.svg',
                      color: XColor.black,
                      width: 58,
                      height: 58
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).newAccount,
                    style: const TextStyle(
                        fontSize: 16,
                        color: XColor.black
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountItem(
    AccountItem item,
    ValueChanged<AccountItem> onPressed
  ) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: XColor.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () { onPressed(item); },
          child: Padding(
            padding: const EdgeInsets.only(
                left: 28, top: 20, right: 28, bottom: 20
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                          fontSize: 18,
                          color: XColor.black
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      S.of(context).urlX(item.url),
                      style: const TextStyle(
                          fontSize: 14,
                          color: XColor.grayColor
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      S.of(context).descX(item.desc),
                      style: const TextStyle(
                          fontSize: 14,
                          color: XColor.grayColor
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                      'assets/svg/ic_arrow_right.svg',
                      color: XColor.black,
                      width: 22,
                      height: 22
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActionResult {

  final AccountAction action;
  final AccountItem item;

  ActionResult({
    required this.action,
    required this.item
  });
}

enum AccountAction {
  delete,
  update
}