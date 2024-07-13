import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final BorderSide? borderSide;
  final AlignmentGeometry textAlign;
  final double? radius;
  final bool isLoading;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.textColor,
      this.text,
      this.color,
      this.child,
      this.width,
      this.height,
      this.borderSide,
      this.radius = 12,
      this.isLoading = false,
      this.textSize,
      this.textAlign = Alignment.center,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading ? true : false,
      child: SizedBox(
        width: width,
        child: MaterialButton(
          minWidth: width,
          height: height ?? 45,
          elevation: 0,
          highlightElevation: 0,
          padding: EdgeInsets.zero,
          onPressed: onPressed ?? () {},
          color: color,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius!),
              borderSide: borderSide ?? BorderSide.none),
          child: child ??
              Align(
                alignment: textAlign,
                child: Text(text!,
                    style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: textSize ?? 12,
                        fontWeight: fontWeight ?? FontWeight.w600)),
              ),
        ),
      ),
    );
  }
}
