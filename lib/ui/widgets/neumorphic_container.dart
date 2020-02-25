import 'dart:ui';
import 'package:flutter/material.dart';

/// Class forked from https://gist.github.com/av/014f3ae1b2842d5ac6e559781ef4e380
/// Implement the neumorphic design trend on a container and some smooth animations to react on click events
class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final double height;
  final double width;

  NeumorphicButton({
    Key key,
    this.child,
    this.bevel = 10.0,
    this.color = const Color(0xFFB0BEC5),
    this.height = 25.0,
    this.width = 25.0,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      constraints: BoxConstraints(
        maxHeight: widget.height,
        maxWidth: widget.width,
        minHeight: widget.height,
        minWidth: widget.width,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.bevel * 10),
        shape: BoxShape.rectangle,
        color: widget.color,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.lerp(widget.color, Colors.black, .1),
              widget.color,
              widget.color,
              Color.lerp(widget.color, Colors.white, .5),
            ],
            stops: [
              0.0,
              .3,
              .6,
              1.0,
            ]),
        boxShadow: [
          BoxShadow(
            blurRadius: widget.bevel,
            spreadRadius: 4.0,
            offset: -widget.blurOffset,
            color: Color.lerp(widget.color, Colors.white, .6),
          ),
          BoxShadow(
            blurRadius: widget.bevel,
            spreadRadius: 4.0,
            offset: widget.blurOffset,
            color: Color.lerp(widget.color, Colors.black, .3),
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
