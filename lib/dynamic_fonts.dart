// GENERATED CODE - DO NOT EDIT

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:dynamic_fonts/src/google_fonts_base.dart';
import 'package:dynamic_fonts/src/google_fonts_descriptor.dart';
import 'package:dynamic_fonts/src/google_fonts_variant.dart';
import 'package:flutter/material.dart';

/// A collection of properties used to specify custom behavior of the
/// DynamicFonts library.
class _Config {
  /// Whether or not the DynamicFonts library can make network requests to
  /// retrieve font files.
  var allowRuntimeFetching = true;
}

typedef TextStyleBuilder = TextStyle Function({
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<ui.Shadow>? shadows,
  List<ui.FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
});

typedef TextThemeBuilder = TextTheme Function([TextTheme?]);

class DynamicFonts {
  /// Configuration for the [DynamicFonts] library.
  ///
  /// Use this to define custom behavior of the DynamicFonts library in your app.
  /// For example, if you do not want the DynamicFonts library to make any http
  /// requests for fonts, add the following snippet to your app's `main` method.
  ///
  /// ```dart
  /// DynamicFonts.config.allowRuntimeFetching = false;
  /// ```
  static final config = _Config();

  static Future<List<void>> pendingFonts([List<dynamic>? _]) =>
      Future.wait(pendingFontFutures);

  static final Map<String, TextStyleBuilder> _styleMap = {};

  /// Get a map of all available fonts.
  ///
  /// Returns a map where the key is the name of the font family and the value
  /// is the corresponding [DynamicFonts] method.
  static Map<String, TextStyleBuilder> asMap() => Map.unmodifiable(_styleMap);

  static final Map<String, TextThemeBuilder> _themeMap = {};

  /// Get a map of all available fonts and their associated text themes.
  ///
  /// Returns a map where the key is the name of the font family and the value
  /// is the corresponding [DynamicFonts] `TextTheme` method.
  static Map<String, TextThemeBuilder> _asMapOfTextThemes() =>
      Map.unmodifiable(_themeMap);

  static void register(
      String familyName, Map<DynamicFontsVariant, DynamicFontsFile> variantMap,
      {bool eager = false}) {
    final style = styleBuilder(familyName, variantMap, eager);
    _styleMap[familyName] = style;
    _themeMap[familyName] = themeBuilder(style);
  }

  /// Retrieve a font by family name.
  ///
  /// Applies the given font family to the given [textStyle] and returns the
  /// resulting [TextStyle].
  ///
  /// Note: [fontFamily] is case-sensitive.
  ///
  /// Parameter [fontFamily] must not be `null`. Throws if no font by name
  /// [fontFamily] exists.
  static TextStyle getFont(
    String fontFamily, {
    TextStyle? textStyle,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    final fonts = DynamicFonts.asMap();
    if (!fonts.containsKey(fontFamily)) {
      throw Exception("No font family by name '$fontFamily' was found.");
    }
    return fonts[fontFamily]!(
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  /// Retrieve a text theme by its font family name.
  ///
  /// Applies the given font family to the given [textTheme] and returns the
  /// resulting [textTheme].
  ///
  /// Note: [fontFamily] is case-sensitive.
  ///
  /// Parameter [fontFamily] must not be `null`. Throws if no font by name
  /// [fontFamily] exists.
  static TextTheme getTextTheme(String fontFamily, [TextTheme? textTheme]) {
    final fonts = _asMapOfTextThemes();
    if (!fonts.containsKey(fontFamily)) {
      throw Exception("No font family by name '$fontFamily' was found.");
    }
    return fonts[fontFamily]!(textTheme);
  }

  static TextThemeBuilder themeBuilder(TextStyleBuilder styleBuilder) =>
      ([textTheme]) {
        textTheme ??= ThemeData.light().textTheme;
        return TextTheme(
          displayLarge: styleBuilder(textStyle: textTheme.displayLarge),
          displayMedium: styleBuilder(textStyle: textTheme.displayMedium),
          displaySmall: styleBuilder(textStyle: textTheme.displaySmall),
          headlineLarge: styleBuilder(textStyle: textTheme.headlineLarge),
          headlineMedium: styleBuilder(textStyle: textTheme.headlineMedium),
          headlineSmall: styleBuilder(textStyle: textTheme.headlineSmall),
          titleLarge: styleBuilder(textStyle: textTheme.titleLarge),
          titleMedium: styleBuilder(textStyle: textTheme.titleMedium),
          titleSmall: styleBuilder(textStyle: textTheme.titleSmall),
          bodyLarge: styleBuilder(textStyle: textTheme.bodyLarge),
          bodyMedium: styleBuilder(textStyle: textTheme.bodyMedium),
          bodySmall: styleBuilder(textStyle: textTheme.bodySmall),
          labelLarge: styleBuilder(textStyle: textTheme.labelLarge),
          labelMedium: styleBuilder(textStyle: textTheme.labelMedium),
          labelSmall: styleBuilder(textStyle: textTheme.labelSmall),
        );
      };

  static TextStyleBuilder styleBuilder(
    String fontFamily,
    Map<DynamicFontsVariant, DynamicFontsFile> variantMap,
    bool eager,
  ) =>
      ({
        textStyle,
        color,
        backgroundColor,
        fontSize,
        fontWeight,
        fontStyle,
        letterSpacing,
        wordSpacing,
        textBaseline,
        height,
        locale,
        foreground,
        background,
        shadows,
        fontFeatures,
        decoration,
        decorationColor,
        decorationStyle,
        decorationThickness,
      }) {
        assert(variantMap.isNotEmpty, 'variantMap must not be empty.');
        return googleFontsTextStyle(
          textStyle: textStyle,
          fontFamily: fontFamily,
          color: color,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          fonts: variantMap,
          eager: eager,
        );
      };
}

/// Represents a font variant in Flutter-specific types.
class DynamicFontsVariant extends GoogleFontsVariant {
  const DynamicFontsVariant({
    required FontWeight fontWeight,
    required FontStyle fontStyle,
  }) : super(fontWeight: fontWeight, fontStyle: fontStyle);
}

/// Describes a font file as it is _expected_ to be received from the server.
///
/// If a file is retrieved and its hash does not match [expectedFileHash], or it
/// is not of [expectedLength] bytes length, the font will not be loaded, and
/// the file will not be stored on the device.
///
/// Clients will need to subclass this to provide the correct URL. If the URL
/// depends on the font variant, consider a pattern like this:
///
/// ```
/// class MyFontFile extends DynamicFontsFile {
///   FiraGoFile(this.variant, String expectedFileHash, int expectedLength)
///       : super(expectedFileHash, expectedLength);
///
///   final DynamicFontsVariant variant;
///
///   @override
///   String get url =>
///       'https://example.com/MyFont-${variant.toApiFilenamePart()}.ttf';
/// }
/// ```
abstract class DynamicFontsFile extends GoogleFontsFile {
  DynamicFontsFile(String expectedFileHash, int expectedLength)
      : super(expectedFileHash, expectedLength);

  @override
  String get url;
}
