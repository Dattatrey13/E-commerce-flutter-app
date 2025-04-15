import '../config.dart';

class LatoFontStyle extends StatelessWidget {
  final String? text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final GestureTapCallback? onTap;
  final TextOverflow overflow;
  final double? letterSpacing;
  final TextAlign textAlign;
  final bool softWrap;
  final int maxLines;

  const LatoFontStyle({
    Key? key,
    this.text,
    this.color,
    this.onTap,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
    this.fontSize = FontSizes.f16,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = true,
    this.maxLines = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text!,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        style: GoogleFonts.lato(
          color: color,
          fontSize: AppScreenUtil().fontSize(fontSize),
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
        ),
        softWrap: softWrap,
      ),
    );
  }
}
