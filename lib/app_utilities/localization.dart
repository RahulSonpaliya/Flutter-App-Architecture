import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizations{
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en' : {
      'app_name' : 'My App',
      'ok' : 'OK',
      'cancel_caps' : 'CANCEL',
      'retry' : 'RETRY',
      'unauthorized_access' : 'Your last login session is expired, please login again.',
      'internet_connection_msg' : 'Please check your internet connection & try again',
    },
  };

  String getAny(String key) => _localizedValues[locale.languageCode][key];
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations>{

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }
}