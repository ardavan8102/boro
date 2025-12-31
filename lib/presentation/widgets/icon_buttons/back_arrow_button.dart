import 'package:boro/core/consts/colors.dart';
import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
    required this.function,
  });

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        splashColor: Colors.white.withValues(alpha: .7),
        onTap: function,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(0, 8)
              )
            ]
          ),
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}