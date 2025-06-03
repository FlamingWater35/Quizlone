import 'dart:math';

import 'package:flutter/material.dart';

import '../models/term.dart';
import '../providers/study/study_options_provider.dart';

class FlashcardWidget extends StatefulWidget {
  final Term term;
  final bool isFlipped;
  final VoidCallback onTap;
  final FlashcardStartSide startSide;
  final double height;

  const FlashcardWidget({
    super.key,
    required this.term,
    required this.isFlipped,
    required this.onTap,
    required this.startSide,
    this.height = 250.0,
  });

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation =
        Tween<double>(begin: 0, end: 1).animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {});
  }

  @override
  void didUpdateWidget(covariant FlashcardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.isFlipped) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
    if (widget.term != oldWidget.term && oldWidget.isFlipped) {
      if (!widget.isFlipped && _animationController.value != 0.0) {
        _animationController.value = 0.0;
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final angle = _animation.value * pi;
    final transform =
        Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);

    final String frontText =
        widget.startSide == FlashcardStartSide.term
            ? widget.term.termText
            : widget.term.definitionText;
    final String backText =
        widget.startSide == FlashcardStartSide.term
            ? widget.term.definitionText
            : widget.term.termText;

    Widget cardFaceToShow;
    if (_animationController.value < 0.5) {
      cardFaceToShow = _buildCardFace(
        frontText,
        Theme.of(context).colorScheme.primaryContainer,
        true,
      );
    } else {
      cardFaceToShow = Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateY(pi),
        child: _buildCardFace(
          backText,
          Theme.of(context).colorScheme.secondaryContainer,
          false,
        ),
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      child: Transform(
        transform: transform,
        alignment: Alignment.center,
        child: SizedBox(
          height: widget.height,
          width: double.infinity,
          child: cardFaceToShow,
        ),
      ),
    );
  }

  Widget _buildCardFace(String text, Color backgroundColor, bool isFront) {
    return Card(
      elevation: 4.0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color:
                  isFront
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
