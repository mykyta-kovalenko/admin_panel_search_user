/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/joanneRobinson.png
  AssetGenImage get joanneRobinson =>
      const AssetGenImage('assets/images/joanneRobinson.png');

  /// File path: assets/images/joeMike.png
  AssetGenImage get joeMike => const AssetGenImage('assets/images/joeMike.png');

  /// File path: assets/images/johnJameson.png
  AssetGenImage get johnJameson =>
      const AssetGenImage('assets/images/johnJameson.png');

  /// File path: assets/images/johnJohnson.png
  AssetGenImage get johnJohnson =>
      const AssetGenImage('assets/images/johnJohnson.png');

  /// File path: assets/images/josephSmith.png
  AssetGenImage get josephSmith =>
      const AssetGenImage('assets/images/josephSmith.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [joanneRobinson, joeMike, johnJameson, johnJohnson, josephSmith];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bitmap.svg
  String get bitmap => 'assets/svg/bitmap.svg';

  /// File path: assets/svg/pureMatchLogo.svg
  String get pureMatchLogo => 'assets/svg/pureMatchLogo.svg';

  /// List of all assets
  List<String> get values => [bitmap, pureMatchLogo];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
