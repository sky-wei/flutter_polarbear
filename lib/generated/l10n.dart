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

  /// `??????????????????!`
  String get accountExists {
    return Intl.message(
      '??????????????????!',
      name: 'accountExists',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????!`
  String get accountPasswordError {
    return Intl.message(
      '?????????????????????!',
      name: 'accountPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????!`
  String get updateInfoError {
    return Intl.message(
      '??????????????????!',
      name: 'updateInfoError',
      desc: '',
      args: [],
    );
  }

  /// `????????????!`
  String get handlerError {
    return Intl.message(
      '????????????!',
      name: 'handlerError',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????!`
  String get deleteInfoError {
    return Intl.message(
      '??????????????????!',
      name: 'deleteInfoError',
      desc: '',
      args: [],
    );
  }

  /// `????????????!`
  String get passwordError {
    return Intl.message(
      '????????????!',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `????????????????????????`
  String get copyToClipboard {
    return Intl.message(
      '????????????????????????',
      name: 'copyToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????!`
  String get nameNotEmpty {
    return Intl.message(
      '??????????????????!',
      name: 'nameNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????!`
  String get passwordNotEmpty {
    return Intl.message(
      '??????????????????!',
      name: 'passwordNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????!`
  String get urlNotEmpty {
    return Intl.message(
      '??????????????????!',
      name: 'urlNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `??????????????????!`
  String get descNotEmpty {
    return Intl.message(
      '??????????????????!',
      name: 'descNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????`
  String get deleteAccountSuccess {
    return Intl.message(
      '?????????????????????',
      name: 'deleteAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????`
  String get changeAccountSuccess {
    return Intl.message(
      '?????????????????????',
      name: 'changeAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????`
  String get createAccountSuccess {
    return Intl.message(
      '?????????????????????',
      name: 'createAccountSuccess',
      desc: '',
      args: [],
    );
  }

  /// `????????????????????????`
  String get newPasswordNotEmpty {
    return Intl.message(
      '????????????????????????',
      name: 'newPasswordNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get importSuccess {
    return Intl.message(
      '???????????????',
      name: 'importSuccess',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get exportSuccess {
    return Intl.message(
      '???????????????',
      name: 'exportSuccess',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get importError {
    return Intl.message(
      '???????????????',
      name: 'importError',
      desc: '',
      args: [],
    );
  }

  /// `???????????????`
  String get exportError {
    return Intl.message(
      '???????????????',
      name: 'exportError',
      desc: '',
      args: [],
    );
  }

  /// `?????????????????????`
  String get clearDataComplete {
    return Intl.message(
      '?????????????????????',
      name: 'clearDataComplete',
      desc: '',
      args: [],
    );
  }

  /// `????????????????????????`
  String get passwordInconsistent {
    return Intl.message(
      '????????????????????????',
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
