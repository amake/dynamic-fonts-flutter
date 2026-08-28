// GENERATED CODE - DO NOT EDIT

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'google_fonts_base.dart';
import 'google_fonts_config.dart';
import 'google_fonts_descriptor.dart';
import 'google_fonts_variant.dart';

/// A function that builds a [TextStyle] with the given parameters.
typedef TextStyleBuilder =
    TextStyle Function({
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

/// A function that builds a [TextTheme] with the given parameters.
typedef TextThemeBuilder = TextTheme Function([TextTheme?]);

/// Provides configuration, and static methods to obtain [TextStyle]s and [TextTheme]s.
///
/// Obtain a map of available fonts with [asMap]. Retrieve a font by family name
/// with [getFont]. Retrieve a text theme by its font family name [getTextTheme].
///
/// Check out the [README](https://pub.dev/packages/dynamic_fonts) for more info.
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
  static final config = DynamicFontsConfig();

  /// Returns a [Future] which resolves when requested fonts have finished
  /// loading and are ready to be rendered on screen.
  ///
  /// Usage:
  /// ```dart
  /// GoogleFonts.lato();
  /// GoogleFonts.pacificoTextTheme();
  /// await GoogleFonts.pendingFonts(); // <-- waits until Lato and Pacifico files have loaded.
  /// ```
  ///
  /// To keep things tidy, on can also pass in requested fonts as a list
  /// to [pendingFonts].
  ///
  /// ```dart
  /// await GoogleFonts.pendingFonts([
  ///   GoogleFonts.lato(),
  ///   GoogleFonts.pacificoTextTheme()
  /// ]);
  /// ```
  ///
  /// To avoid visual font swaps that occur when a font is loading,
  /// consider using [FutureBuilder]. Note: This future cannot be created in
  /// [build], as described in [FutureBuilder]'s documentation.
  ///
  /// ```dart
  /// late Future googleFontsPending;
  ///
  /// @override
  /// void initState() {
  ///   super.initState();
  ///   googleFontsPending = GoogleFonts.pendingFonts([
  ///     ...
  ///   ]);
  /// }
  ///
  /// @override
  /// Widget build(BuildContext context) {
  ///   return FutureBuilder(
  ///     future: googleFontsPending,
  ///     builder: (context, snapshot) {
  ///       if (snapshot.connectionState != ConnectionState.done) {
  ///         return const SizedBox();
  ///       }
  ///       ...
  ///     }
  ///   );
  /// }
  /// ```
  static Future<List<void>> pendingFonts([List<dynamic>? _]) => Future.wait(pendingFontFutures);

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
  static Map<String, TextThemeBuilder> _asMapOfTextThemes() => Map.unmodifiable(_themeMap);

  /// Register a font family with the given [familyName] and [variantMap].
  ///
  /// Specify `eager: true` to load all variants of the font immediately.
  /// Otherwise, each variant will be lazily loaded but as a separate family.
  /// See
  /// [here](https://github.com/flutter/flutter/issues/174576#issuecomment-3229129849)
  /// for details.
  static void register(
    String familyName,
    Map<DynamicFontsVariant, DynamicFontsFile> variantMap, {
    bool eager = false,
  }) {
    final TextStyleBuilder style = styleBuilder(familyName, variantMap, eager);
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
    final Map<String, TextStyleBuilder> fonts = DynamicFonts.asMap();
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
    final Map<String, TextThemeBuilder> fonts = _asMapOfTextThemes();
    if (!fonts.containsKey(fontFamily)) {
      throw Exception("No font family by name '$fontFamily' was found.");
    }
    return fonts[fontFamily]!(textTheme);
  }

  /// Returns a [TextThemeBuilder] that applies the given [styleBuilder] to each
  /// text style in the [TextTheme].
  static TextThemeBuilder themeBuilder(TextStyleBuilder styleBuilder) => ([textTheme]) {
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

  /// Returns a [TextStyleBuilder] that applies the given [fontFamily] and
  /// [variantMap] to the given [textStyle].
  ///
  /// Specify `eager: true` to load all variants of the font immediately.
  /// Otherwise, each variant will be lazily loaded but as a separate family.
  /// See
  /// [here](https://github.com/flutter/flutter/issues/174576#issuecomment-3229129849)
  /// for details.
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
  /// Creates a [DynamicFontsVariant] with the given [fontWeight] and [fontStyle].
  const DynamicFontsVariant({required super.fontWeight, required super.fontStyle});
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
/// ```dart
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
  /// Creates a [DynamicFontsFile] with the given [expectedFileHash] and
  /// [expectedLength].
  DynamicFontsFile(super.expectedFileHash, super.expectedLength);

  @override
  String get url;
}
