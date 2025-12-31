import 'dart:async';

import 'package:boro/gen/assets.gen.dart';
import 'package:boro/views/home_screen.dart';
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
          CupertinoPageRoute(builder: (_) => const HomeScreen())
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  'اپلیکیشن بُــرو',
                ),

                const SizedBox(height: 12),

                Text(
                  'با بُــرو، رفتن دست خودته',
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}