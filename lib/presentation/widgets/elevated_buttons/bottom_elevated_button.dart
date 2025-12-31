import 'package:flutter/material.dart';

class BottomElevatedButton extends StatelessWidget {
  const BottomElevatedButton({
    super.key, required this.label, required this.function,
  });

  final String label;
  final Function() function;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    final textTheme = theme.textTheme;

    final elevatedButtonTheme = theme.elevatedButtonTheme;

    return ElevatedButton(
      onPressed: function,
      style: elevatedButtonTheme.style,
      child: Text(
        label,
        style: textTheme.labelLarge!.copyWith(
          color: Colors.white
        ),
      ),
    );
  }
}