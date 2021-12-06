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

  /// `Library Robin`
  String get Library {
    return Intl.message(
      'Library Robin',
      name: 'Library',
      desc: '',
      args: [],
    );
  }

  /// `Busqueda de Libros`
  String get SearchFor {
    return Intl.message(
      'Busqueda de Libros',
      name: 'SearchFor',
      desc: '',
      args: [],
    );
  }

  /// `Autor`
  String get Author {
    return Intl.message(
      'Autor',
      name: 'Author',
      desc: '',
      args: [],
    );
  }

  /// `Favoritos`
  String get Favorites {
    return Intl.message(
      'Favoritos',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Nombre libro`
  String get NameBook {
    return Intl.message(
      'Nombre libro',
      name: 'NameBook',
      desc: '',
      args: [],
    );
  }

  /// `Libro agregado a favoritos`
  String get BookAddFavorites {
    return Intl.message(
      'Libro agregado a favoritos',
      name: 'BookAddFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Cerrado`
  String get Closed {
    return Intl.message(
      'Cerrado',
      name: 'Closed',
      desc: '',
      args: [],
    );
  }

  /// `Titulo: `
  String get Tittle {
    return Intl.message(
      'Titulo: ',
      name: 'Tittle',
      desc: '',
      args: [],
    );
  }

  /// `Agregar a favoritos`
  String get AddToFavorites {
    return Intl.message(
      'Agregar a favoritos',
      name: 'AddToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Ver Detalle`
  String get ViewDetail {
    return Intl.message(
      'Ver Detalle',
      name: 'ViewDetail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
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
