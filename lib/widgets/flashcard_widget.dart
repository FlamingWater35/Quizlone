import 'package:flutter/material.dart';

import '../models/enums/enums.dart';
import '../models/term.dart';

class FlashcardWidget extends StatefulWidget {
  const FlashcardWidget({
    super.key,
    required this.term,
    required this.isFlipped,
    required this.onTap,
    required this.startSide,
    this.height = 250.0,
  });

  final double height;
  final bool isFlipped;
  final VoidCallback onTap;
  final FlashcardStartSide startSide;
  final Term term;

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backScaleAnimation;
  late Animation<double> _frontScaleAnimation;

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
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _frontScaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _backScaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
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

  @override
  Widget build(BuildContext context) {
    final String frontText =
        widget.startSide == FlashcardStartSide.term
            ? widget.term.termText
            : widget.term.definitionText;
    final String backText =
        widget.startSide == FlashcardStartSide.term
            ? widget.term.definitionText
            : widget.term.termText;

    return GestureDetector(
      onTap: widget.onTap,
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final isFrontVisible = _animationController.value < 0.5;
            final scale =
                isFrontVisible
                    ? _frontScaleAnimation.value
                    : _backScaleAnimation.value;
            final text = isFrontVisible ? frontText : backText;
            final isFrontCard = isFrontVisible;

            return Transform.scale(
              scale: scale,
              child: _buildCardFace(
                text,
                isFrontCard
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.secondaryContainer,
                isFrontCard,
              ),
            );
          },
        ),
      ),
    );
  }
}
