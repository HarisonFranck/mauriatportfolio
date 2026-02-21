import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderNav extends StatefulWidget {
  HeaderNav({
    required this.indexNav,
    required this.indexHover,
    required this.name,
    required this.myIndex,
    this.onEnterHover,
    this.onExitHover,
    this.onTapNav,
  });

  int indexNav = 0;
  int indexHover = 100;
  int myIndex;
  final onEnterHover;
  final onExitHover;
  final onTapNav;
  String name;

  @override
  State<HeaderNav> createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.onEnterHover,
      onExit: widget.onExitHover,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTapNav,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 95,
          height: 30,
          decoration: BoxDecoration(
            color: (widget.indexHover == widget.myIndex)
                ? const Color.fromARGB(255, 72, 94, 215).withOpacity(0.3)
                : Colors.transparent,

            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 14,
                color: (widget.indexHover == widget.myIndex)
                    ? Colors.white
                    : Colors.white70,
                fontWeight: (widget.indexHover == widget.myIndex)
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
