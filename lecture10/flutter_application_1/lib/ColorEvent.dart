

import 'dart:ui';

sealed class ColorEvent{}

final class NewColorEvent extends ColorEvent{
  final Color color;

  NewColorEvent({required this.color});
}

final class NewRandomColorEvent extends ColorEvent{}

final class ResetColorEvent extends ColorEvent{}

