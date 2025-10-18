import 'package:flutter/material.dart';

/// A reusable title widget with a customizable underline.
///
/// Features:
/// - Accepts either a fixed underline width (in pixels) via [underlineWidth]
///   or a fractional width relative to the title text via [underlineFraction].
/// - Customizable underline height, color and spacing.
/// - Honors the provided [textStyle] or falls back to Theme styles.
///
/// Example usage:
/// ```dart
/// UnderlineTitle(
///   text: 'Our Services',
///   underlineFraction: 0.18,
///   underlineHeight: 3,
///   underlineColor: Colors.blue,
/// );
/// ```
class UnderlineTitle extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  /// If provided, this exact pixel width will be used for the underline.
  final double? underlineWidth;

  /// Fraction of the text width to use for the underline (0.0 - 1.0).
  /// Used only when [underlineWidth] is null.
  final double underlineFraction;

  /// Thickness of the underline in pixels.
  final double underlineHeight;

  /// Vertical spacing between the text and the underline.
  final double spacing;

  /// Color of the underline.
  final Color underlineColor;

  /// Alignment of the underline relative to the text.
  /// Use [Alignment.centerLeft] to left-align under the text, center to center, etc.
  final Alignment underlineAlignment;


  const UnderlineTitle({
    super.key,
    required this.text,
    this.textStyle,
    this.underlineWidth,
    this.underlineFraction = 0.65,
    this.underlineHeight = 3.0,
    this.spacing = 8.0,
    this.underlineColor = Colors.black87,
    this.underlineAlignment = Alignment.center,
  })  : assert(underlineFraction > 0 && underlineFraction <= 1,
            'underlineFraction must be between 0 (exclusive) and 1 (inclusive)'),
        assert(underlineHeight >= 0, 'underlineHeight must be >= 0');

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveStyle = textStyle ??
        Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);

    // Measure the text width using a TextPainter so we can compute a fraction of it.
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: effectiveStyle),
      maxLines: 3,
      textDirection: TextDirection.ltr,
    )..layout();

    final double measuredTextWidth = textPainter.width;

    // Determine the final underline width (prefer explicit underlineWidth if provided)
    final double finalUnderlineWidth = underlineWidth ?? measuredTextWidth * underlineFraction;

    // Build: text then a small gap then an aligned underline container
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title text centered horizontally by default (use textAlign if needed)
        Text(
          text,
          style: effectiveStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: spacing),
        // Use Row+Align to control underline alignment relative to available width.
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Expand provides the full width; then Align positions the underline inside it
            Expanded(
              child: Align(
                alignment: underlineAlignment,
                child: Container(
                  width: finalUnderlineWidth,
                  height: underlineHeight,
                  decoration: BoxDecoration(
                    color: underlineColor,
                    borderRadius: BorderRadius.circular(underlineHeight / 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
