
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class ColorState extends Equatable{
  final Color color;

  const ColorState(this.color);

  @override
  List<Object> get props => [color];
}


final class ColorInitialState extends ColorState{
  const ColorInitialState(): super(Colors.red);
}

final class ColorCurrentState extends ColorState{
  const ColorCurrentState(super.color);
}