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

  /// `Devices`
  String get homeTitle {
    return Intl.message(
      'Devices',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Device Info`
  String get editViewTitle {
    return Intl.message(
      'Edit Device Info',
      name: 'editViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit DeviceName`
  String get editDevieNameTextFieldLabel {
    return Intl.message(
      'Edit DeviceName',
      name: 'editDevieNameTextFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit Price hour`
  String get editDeviePriceTextFieldLabel {
    return Intl.message(
      'Edit Price hour',
      name: 'editDeviePriceTextFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editButtonTitle {
    return Intl.message(
      'Edit',
      name: 'editButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveButtonTitle {
    return Intl.message(
      'Save',
      name: 'saveButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancelButtonTile {
    return Intl.message(
      'cancel',
      name: 'cancelButtonTile',
      desc: '',
      args: [],
    );
  }

  /// `You have edited the info succcessfuly`
  String get editSuccessfulMessage {
    return Intl.message(
      'You have edited the info succcessfuly',
      name: 'editSuccessfulMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your order done successfuly`
  String get generalSuccessMessage {
    return Intl.message(
      'Your order done successfuly',
      name: 'generalSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `per hour`
  String get perHour {
    return Intl.message(
      'per hour',
      name: 'perHour',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get enterNameTextFieldLabel {
    return Intl.message(
      'User Name',
      name: 'enterNameTextFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Set Time`
  String get setTimeMessage {
    return Intl.message(
      'Set Time',
      name: 'setTimeMessage',
      desc: '',
      args: [],
    );
  }

  /// `UnCorrect Selected Time`
  String get unCorrectSelectedTime {
    return Intl.message(
      'UnCorrect Selected Time',
      name: 'unCorrectSelectedTime',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get errorTitle {
    return Intl.message(
      'Error',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get hours {
    return Intl.message(
      'hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Spent Time`
  String get spentTimeTextFieldLabel {
    return Intl.message(
      'Spent Time',
      name: 'spentTimeTextFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your price `
  String get yourPriceMessage {
    return Intl.message(
      'Your price ',
      name: 'yourPriceMessage',
      desc: '',
      args: [],
    );
  }

  /// `total price is :`
  String get totalPriceMessage {
    return Intl.message(
      'total price is :',
      name: 'totalPriceMessage',
      desc: '',
      args: [],
    );
  }

  /// `Finish Session`
  String get finishButtonSessionTitle {
    return Intl.message(
      'Finish Session',
      name: 'finishButtonSessionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitle {
    return Intl.message(
      'Settings',
      name: 'settingsTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Langagues`
  String get langagueTitle {
    return Intl.message(
      'The Langagues',
      name: 'langagueTitle',
      desc: '',
      args: [],
    );
  }

  /// `Can"t be empty`
  String get emptyTextFieldError {
    return Intl.message(
      'Can"t be empty',
      name: 'emptyTextFieldError',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
