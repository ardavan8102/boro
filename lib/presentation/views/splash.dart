import 'dart:async';

import 'package:boro/core/consts/strings.dart';
import 'package:boro/gen/assets.gen.dart';
import 'package:boro/presentation/views/map_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _opacity = 1;
      });
    });


    // navigate
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (_) => const MapScreen())
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 3),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Image.asset(
                  Assets.img.boroTransparent.path,
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 24),
                    
                Text(
                  'اپلیکیشن ${AppStrings.brandNameFa}',
                  style: textTheme.headlineLarge,
                ),

                const SizedBox(height: 12),

                Text(
                  'با ${AppStrings.brandNameFa} رفتن دست خودته',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}