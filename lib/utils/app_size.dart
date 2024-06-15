import 'package:flutter/material.dart';

class AppSize {
  static bool isTablet = false;

  static const double mobileWidth = 428;
  static const double tabletWidth = 1024;

  static Size size = const Size(0, 0);
  static double bottomPadding = 0;
  static double topPadding = 0;
  static double useWidth = 0;

  // All fontSizes
  static double fontSize16 = 0;

  static void setupFontSizes() {
    fontSize16 = getSize(16);
  }

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
    setupFontSizes();
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

  static double get size16 => fontSize16;
}
