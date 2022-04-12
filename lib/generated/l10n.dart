// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `PolarBear`
  String get appName {
    return Intl.message(
      'PolarBear',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Account Manage`
  String get accountManage {
    return Intl.message(
      'Account Manage',
      name: 'accountManage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get appNew {
    return Intl.message(
      'New',
      name: 'appNew',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get source {
    return Intl.message(
      'Source',
      name: 'source',
      desc: '',
      args: [],
    );
  }

  /// `Url`
  String get url {
    return Intl.message(
      'Url',
      name: 'url',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get desc {
    return Intl.message(
      'Description',
      name: 'desc',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `ConfirmPassword`
  String get confirmPassword {
    return Intl.message(
      'ConfirmPassword',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `NewPassword`
  String get newPassword {
    return Intl.message(
      'NewPassword',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Storage`
  String get storage {
    return Intl.message(
      'Storage',
      name: 'storage',
      desc: '',
      args: [],
    );
  }

  /// `Clear Data`
  String get clearData {
    return Intl.message(
      'Clear Data',
      name: 'clearData',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get newAccount {
    return Intl.message(
      'New Account',
      name: 'newAccount',
      desc: '',
      args: [],
    );
  }

  /// `Version: {value}`
  String versionX(Object value) {
    return Intl.message(
      'Version: $value',
      name: 'versionX',
      desc: '',
      args: [value],
    );
  }

  /// `Url: {value}`
  String urlX(Object value) {
    return Intl.message(
      'Url: $value',
      name: 'urlX',
      desc: '',
      args: [value],
    );
  }

  /// `Description: {value}`
  String descX(Object value) {
    return Intl.message(
      'Description: $value',
      name: 'descX',
      desc: '',
      args: [value],
    );
  }

  /// `账号已经存在!`
  String get accountExists {
    return Intl.message(
      '账号已经存在!',
      name: 'accountExists',
      desc: '',
      args: [],
    );
  }

  /// `账号或密码错误!`
  String get accountPasswordError {
    return Intl.message(
      '账号或密码错误!',
      name: 'accountPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `更新信息错误!`
  String get updateInfoError {
    return Intl.message(
      '更新信息错误!',
      name: 'updateInfoError',
      desc: '',
      args: [],
    );
  }

  /// `处理异常!`
  String get handlerError {
    return Intl.message(
      '处理异常!',
      name: 'handlerError',
      desc: '',
      args: [],
    );
  }

  /// `删除信息错误!`
  String get deleteInfoError {
    return Intl.message(
      '删除信息错误!',
      name: 'deleteInfoError',
      desc: '',
      args: [],
    );
  }

  /// `密码错误!`
  String get passwordError {
    return Intl.message(
      '密码错误!',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `已复制当前信息！`
  String get copyToClipboard {
    return Intl.message(
      '已复制当前信息！',
      name: 'copyToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `名称不能为空!`
  String get nameNotEmpty {
    return Intl.message(
      '名称不能为空!',
      name: 'nameNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `密码不能为空!`
  String get passwordNotEmpty {
    return Intl.message(
      '密码不能为空!',
      name: 'passwordNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `链接不能为空!`
  String get urlNotEmpty {
    return Intl.message(
      '链接不能为空!',
      name: 'urlNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `描述不能为空!`
  String get descNotEmpty {
    return Intl.message(
      '描述不能为空!',
      name: 'descNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `删除账号成功！`
  String get deleteAccountSuccess {
    return Intl.message(
      '删除账号成功！',
      name: 'deleteAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `修改账号成功！`
  String get changeAccountSuccess {
    return Intl.message(
      '修改账号成功！',
      name: 'changeAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `创建账号成功！`
  String get createAccountSuccess {
    return Intl.message(
      '创建账号成功！',
      name: 'createAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `新密码不能为空！`
  String get newPasswordNotEmpty {
    return Intl.message(
      '新密码不能为空！',
      name: 'newPasswordNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `导入成功！`
  String get importSuccess {
    return Intl.message(
      '导入成功！',
      name: 'importSuccess',
      desc: '',
      args: [],
    );
  }

  /// `导出成功！`
  String get exportSuccess {
    return Intl.message(
      '导出成功！',
      name: 'exportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `导入异常！`
  String get importError {
    return Intl.message(
      '导入异常！',
      name: 'importError',
      desc: '',
      args: [],
    );
  }

  /// `导出异常！`
  String get exportError {
    return Intl.message(
      '导出异常！',
      name: 'exportError',
      desc: '',
      args: [],
    );
  }

  /// `清除数据完成！`
  String get clearDataComplete {
    return Intl.message(
      '清除数据完成！',
      name: 'clearDataComplete',
      desc: '',
      args: [],
    );
  }

  /// `密码输入不一致！`
  String get passwordInconsistent {
    return Intl.message(
      '密码输入不一致！',
      name: 'passwordInconsistent',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
