import 'dart:math';
import 'package:flutter/material.dart';
import '../models/enums/enums.dart';
import '../models/term.dart';
import '../services/smooth_scroll.dart';

class FlashcardWidget extends StatefulWidget {
  const FlashcardWidget({
    super.key,
    required this.term,
    required this.isFlipped,
    required this.onTap,
    required this.startSide,
    this.height = 300.0,
    this.disableAnimations = false,
  });

  final bool disableAnimations;
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
  late Animation<double> _animation;
  late SmoothScrollController _backScrollController;
  late AnimationController _controller;
  late SmoothScrollController _frontScrollController;

  @override
  void didUpdateWidget(FlashcardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFlipped != oldWidget.isFlipped) {
      if (widget.disableAnimations) {
        _controller.value = widget.isFlipped ? 1.0 : 0.0;
      } else if (widget.isFlipped) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
    if (widget.term != oldWidget.term) {
      _frontScrollController.jumpTo(0);
      _backScrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _frontScrollController.dispose();
    _backScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _frontScrollController = SmoothScrollController();
    _backScrollController = SmoothScrollController();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    if (widget.isFlipped) {
      _controller.value = 1.0;
    }
  }

  Widget _buildFace(
    String text,
    Color bgColor,
    Color textColor,
    SmoothScrollController scrollController,
  ) {
    const double verticalInset = 16.0;

    return RepaintBoundary(
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 4.0,
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          height: widget.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: verticalInset),
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              thickness: 6.0,
              radius: const Radius.circular(10),
              child: SmoothSingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: widget.height - (verticalInset * 2),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String frontText = widget.startSide == FlashcardStartSide.term
        ? widget.term.termText
        : widget.term.definitionText;
    final String backText = widget.startSide == FlashcardStartSide.term
        ? widget.term.definitionText
        : widget.term.termText;

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final double rotationValue = _animation.value * pi;
          final bool isUnder = rotationValue > (pi / 2);

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(rotationValue),
            alignment: Alignment.center,
            child: isUnder
                ? Transform(
                    transform: Matrix4.rotationY(pi),
                    alignment: Alignment.center,
                    child: _buildFace(
                      backText,
                      Theme.of(context).colorScheme.secondaryContainer,
                      Theme.of(context).colorScheme.onSecondaryContainer,
                      _backScrollController,
                    ),
                  )
                : _buildFace(
                    frontText,
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.onPrimaryContainer,
                    _frontScrollController,
                  ),
          );
        },
      ),
    );
  }
}
