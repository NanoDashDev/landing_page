import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:landing_page/extensions/color_extensions.dart';

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
  bool _isPressed;
  Color _color;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    // _showContainerColorSnackBar();
    setState(() {
      _isPressed = false;
    });
  }

  /*  void _showContainerColorSnackBar() {
    Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(_color.toString()),
    ));
  } */

  @override
  void initState() {
    super.initState();
    _isPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    _color = widget.color ?? Theme.of(context).backgroundColor;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        height: widget.height,
        width: widget.width,
        constraints: BoxConstraints(
          maxHeight: widget.height,
          maxWidth: widget.width,
          minHeight: widget.height,
          minWidth: widget.width,
        ),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          shape: BoxShape.rectangle,
          color: _color,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? _color : Color.lerp(_color, Colors.black, .1),
                _isPressed ? Color.lerp(_color, Colors.black, .05) : _color,
                _isPressed ? Color.lerp(_color, Colors.black, .05) : _color,
                Color.lerp(_color, Colors.white, _isPressed ? .2 : .5),
              ],
              stops: [
                0.0,
                .3,
                .6,
                1.0,
              ]),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: widget.bevel,
                    spreadRadius: 4.0,
                    offset: -widget.blurOffset,
                    color: _color.mix(Colors.white, .6),
                  ),
                  BoxShadow(
                    blurRadius: widget.bevel,
                    spreadRadius: 4.0,
                    offset: widget.blurOffset,
                    color: _color.mix(Colors.black, .3),
                  ),
                ],
        ),
        /* 
        child: Card(
          borderOnForeground: true,
          color: Colors.white,
          elevation: 4.0,
          // margin: const EdgeInsets.all(8.0),
          semanticContainer: false,
          shadowColor: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: Colors.black87,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ), */
        child: widget.child,
        // ),
      ),
    );
  }
}
