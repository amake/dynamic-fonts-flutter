## [2.2.2] - 2025-06-20

* Add missing styles to TextTheme built by `DynamicFonts.themeBuilder`

## [2.2.1] - 2024-03-04

* Validate the variantMap provided to `DynamicFonts.register` and
  `DynamicFonts.styleBuilder`

## [2.2.0] - 2023-07-16

* Optionally eagerly load an entire font family at registration time by passing
  `eager: true` to `DynamicFonts.register`. This solves the [synthetic variant
  problem](https://github.com/material-foundation/flutter-packages/issues/35#issuecomment-959043020)
  inherent in google_fonts at the cost of potentially much longer loading time.
* Synchronize code with google_fonts 5.1.0
* Bump minimum SDK version to 2.14
* Fix incompatibility with Flutter 3.13+

## [2.0.0] - 2021-02-26

* [google_fonts] Migrated the main library to null safety.
* [google_fonts] Require Dart 2.12 or greater.

## [1.1.2] - 2021-01-26

* [google_fonts] Bump dependency constraints for null safety.

## [1.1.1] - 2020-10-02

* [google_fonts] Use conditional imports to separate out web from destkop + mobile file_io implementations.

## [1.1.0] - 2020-07-29

* Fork from [google_fonts](https://pub.dev/packages/google_fonts) 1.1.0
