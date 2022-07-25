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

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Authorization`
  String get auth {
    return Intl.message(
      'Authorization',
      name: 'auth',
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

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get good {
    return Intl.message(
      'Good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get createAccount {
    return Intl.message(
      'Create',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your login and password`
  String get inputLoginAndPassword {
    return Intl.message(
      'Enter your login and password',
      name: 'inputLoginAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login must contain at least 3 characters`
  String get inputErrorLoginInShort {
    return Intl.message(
      'Login must contain at least 3 characters',
      name: 'inputErrorLoginInShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get inputErrorPasswordInShort {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'inputErrorPasswordInShort',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username or password entered`
  String get authErrorMessage {
    return Intl.message(
      'Invalid username or password entered',
      name: 'authErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get error {
    return Intl.message(
      'error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
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

  /// `Product Details`
  String get detail {
    return Intl.message(
      'Product Details',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Total products`
  String get productCount {
    return Intl.message(
      'Total products',
      name: 'productCount',
      desc: '',
      args: [],
    );
  }

  /// `Products list is empty`
  String get productsListIsEmpty {
    return Intl.message(
      'Products list is empty',
      name: 'productsListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Product code`
  String get codeProduct {
    return Intl.message(
      'Product code',
      name: 'codeProduct',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get productRating {
    return Intl.message(
      'Rating',
      name: 'productRating',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get productPrice {
    return Intl.message(
      '\$',
      name: 'productPrice',
      desc: '',
      args: [],
    );
  }

  /// `All category`
  String get allCategory {
    return Intl.message(
      'All category',
      name: 'allCategory',
      desc: '',
      args: [],
    );
  }

  /// `electronics`
  String get electronics {
    return Intl.message(
      'electronics',
      name: 'electronics',
      desc: '',
      args: [],
    );
  }

  /// `jewelery`
  String get jewelery {
    return Intl.message(
      'jewelery',
      name: 'jewelery',
      desc: '',
      args: [],
    );
  }

  /// `men's clothing`
  String get mens {
    return Intl.message(
      'men\'s clothing',
      name: 'mens',
      desc: '',
      args: [],
    );
  }

  /// `women's clothing`
  String get women {
    return Intl.message(
      'women\'s clothing',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get selecCategory {
    return Intl.message(
      'Select category',
      name: 'selecCategory',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
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
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
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
