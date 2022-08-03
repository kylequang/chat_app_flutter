/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic-apple.svg
  SvgGenImage get icApple => const SvgGenImage('assets/icons/ic-apple.svg');

  /// File path: assets/icons/ic-back-arrow.svg
  SvgGenImage get icBackArrow =>
      const SvgGenImage('assets/icons/ic-back-arrow.svg');

  /// File path: assets/icons/ic-back.svg
  SvgGenImage get icBack => const SvgGenImage('assets/icons/ic-back.svg');

  /// File path: assets/icons/ic-calendar.svg
  SvgGenImage get icCalendar =>
      const SvgGenImage('assets/icons/ic-calendar.svg');

  /// File path: assets/icons/ic-camera.svg
  SvgGenImage get icCamera => const SvgGenImage('assets/icons/ic-camera.svg');

  /// File path: assets/icons/ic-caret-down.svg
  SvgGenImage get icCaretDown =>
      const SvgGenImage('assets/icons/ic-caret-down.svg');

  /// File path: assets/icons/ic-close.svg
  SvgGenImage get icClose => const SvgGenImage('assets/icons/ic-close.svg');

  /// File path: assets/icons/ic-error.svg
  SvgGenImage get icError => const SvgGenImage('assets/icons/ic-error.svg');

  /// File path: assets/icons/ic-eye-close.svg
  SvgGenImage get icEyeClose =>
      const SvgGenImage('assets/icons/ic-eye-close.svg');

  /// File path: assets/icons/ic-eye-fill.svg
  SvgGenImage get icEyeFill =>
      const SvgGenImage('assets/icons/ic-eye-fill.svg');

  /// File path: assets/icons/ic-facebook.svg
  SvgGenImage get icFacebook =>
      const SvgGenImage('assets/icons/ic-facebook.svg');

  /// File path: assets/icons/ic-google.svg
  SvgGenImage get icGoogle => const SvgGenImage('assets/icons/ic-google.svg');

  /// File path: assets/icons/ic-link.svg
  SvgGenImage get icLink => const SvgGenImage('assets/icons/ic-link.svg');

  /// File path: assets/icons/ic-send.svg
  SvgGenImage get icSend => const SvgGenImage('assets/icons/ic-send.svg');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/chat_app_logo.png
  AssetGenImage get chatAppLogo =>
      const AssetGenImage('assets/images/chat_app_logo.png');

  /// File path: assets/images/empty_data.jpg
  AssetGenImage get emptyData =>
      const AssetGenImage('assets/images/empty_data.jpg');

  /// File path: assets/images/error.svg
  SvgGenImage get error => const SvgGenImage('assets/images/error.svg');

  /// File path: assets/images/k.png
  AssetGenImage get k => const AssetGenImage('assets/images/k.png');

  /// File path: assets/images/success.svg
  SvgGenImage get success => const SvgGenImage('assets/images/success.svg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
