import 'package:flutter/material.dart';

class AppSize {
  static bool isTablet = false;

  static const double mobileWidth = 428;
  static const double tabletWidth = 1024;

  static Size size = const Size(0, 0);
  static double bottomPadding = 0;
  static double topPadding = 0;
  static double useWidth = 0;

  /// Sets up data based on the provided [MediaQueryData].
  ///
  /// This method initializes various properties such as screen size,
  /// bottom and top padding, and determines the width to be used based
  /// on whether the device is a tablet or a mobile device. The appropriate
  /// width value is assigned to [useWidth], considering the device type.
  ///
  /// Parameters:
  ///   queryData - The [MediaQueryData] obtained from the device's screen.
  static void setupData(MediaQueryData queryData) {
    size = queryData.size;
    bottomPadding = queryData.padding.bottom;
    topPadding = queryData.padding.top;
    if (isTablet) {
      useWidth = tabletWidth;
    } else {
      useWidth = mobileWidth;
    }
  }

  /// Converts a size from pixels to logical pixels.
  ///
  /// This method calculates the equivalent size in logical pixels based on the provided
  /// size in pixels ([pxSize]), the screen width, and the designated width value
  /// ([useWidth]). It's particularly useful for ensuring consistent sizing across
  /// different screen sizes and device types.
  ///
  /// Parameters:
  ///   pxSize - The size in pixels to be converted.
  ///
  /// Returns:
  ///   The equivalent size in logical pixels.
  static double getSize(double pxSize) {
    return size.width * pxSize / useWidth;
  }

  // all Sizes

  static double _size4 = 0;
  static double get size4 => _size4 != 0 ? _size4 : setup4();
  static double setup4() {
    _size4 = getSize(4);
    return _size4;
  }

  static double _size8 = 0;
  static double get size8 => _size8 != 0 ? _size8 : setup8();
  static double setup8() {
    _size8 = getSize(8);
    return _size8;
  }

  static double _size10 = 0;
  static double get size10 => _size10 != 0 ? _size10 : setup10();
  static double setup10() {
    _size10 = getSize(10);
    return _size10;
  }

  static double _size12 = 0;
  static double get size12 => _size12 != 0 ? _size12 : setup12();
  static double setup12() {
    _size12 = getSize(12);
    return _size12;
  }

  static double _size14 = 0;
  static double get size14 => _size14 != 0 ? _size14 : setup14();
  static double setup14() {
    _size14 = getSize(14);
    return _size14;
  }

  static double _size16 = 0;
  static double get size16 => _size16 != 0 ? _size16 : setup16();
  static double setup16() {
    _size16 = getSize(16);
    return _size16;
  }

  static double _size20 = 0;
  static double get size20 => _size20 != 0 ? _size20 : setup20();
  static double setup20() {
    _size20 = getSize(20);
    return _size20;
  }

  static double _size24 = 0;
  static double get size24 => _size24 != 0 ? _size24 : setup24();
  static double setup24() {
    _size24 = getSize(24);
    return _size24;
  }

  static double _size32 = 0;
  static double get size32 => _size32 != 0 ? _size32 : setup32();
  static double setup32() {
    _size32 = getSize(32);
    return _size32;
  }

  static double _size48 = 0;
  static double get size48 => _size48 != 0 ? _size48 : setup48();
  static double setup48() {
    _size48 = getSize(48);
    return _size48;
  }

  static double _size260 = 0;
  static double get size260 => _size260 != 0 ? _size260 : setup260();
  static double setup260() {
    _size260 = getSize(260);
    return _size260;
  }
}
