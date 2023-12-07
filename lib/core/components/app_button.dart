import 'package:flutter/material.dart';

import '../util/constants.dart';


class AppButton extends StatefulWidget {
  final Function()? onTap;
  final String? text;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final bool? enabled;
  final bool? enableScaleAnimation;
  final MaterialStateProperty<OutlinedBorder?>? buttonStyle;
  final TextAlign? textAlign;

  const AppButton({
    this.onTap,
    this.text,
    this.width,
    this.color,
    this.textColor,
    this.padding,
    this.margin,
    this.textStyle,
    this.elevation,
    this.enabled,
    this.height,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.enableScaleAnimation,
    this.buttonStyle,
    this.textAlign,
    super.key,
  });

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.enableScaleAnimation ?? true) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: appButtonScaleAnimationDurationGlobal,
        ),
        lowerBound: 0.0,
        upperBound: 0.1,
      )..addListener(() {
        setState(() {});
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && (widget.enabled ?? true)) {
      _scale = 1 - _controller!.value;
    }

    if (widget.enableScaleAnimation ?? true) {
      return Listener(
        onPointerDown: (details) {
          _controller?.forward();
        },
        onPointerUp: (details) {
          _controller?.reverse();
        },
        child: Transform.scale(
          scale: _scale,
          child: buildButton(),
        ),
      );
    } else {
      return buildButton();
    }
  }

  Widget buildButton() {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: ElevatedButton(

        onPressed: (widget.enabled ?? true)
            ? widget.onTap != null
            ? widget.onTap as void Function()?
            : null
            : null,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size.fromHeight(widget.height ?? defaultButtonHeight),),
          backgroundColor: widget.enabled ?? true
              ? MaterialStateProperty.all(widget.color)
              : MaterialStateProperty.all(widget.disabledColor),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return widget.splashColor;
              } else if (states.contains(MaterialState.hovered)) {
                return widget.hoverColor;
              } else if (states.contains(MaterialState.focused)) {
                return widget.focusColor;
              }
              return null; // Defer to the widget's default.
            },
          ),
          shape: widget.buttonStyle,
          elevation: MaterialStateProperty.all(widget.elevation),
        ),
        child: Text(
          widget.text ?? '',
          style: widget.textStyle ?? const TextStyle(),
          textAlign: widget.textAlign,
        ),
      ),
    );
  }
}
