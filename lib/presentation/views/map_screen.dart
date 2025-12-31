import 'package:boro/core/consts/dimens.dart';
import 'package:boro/presentation/widgets/icon_buttons/back_arrow_button.dart';
import 'package:boro/presentation/widgets/elevated_buttons/bottom_elevated_button.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    //final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            // osm map
            Container(
              height: size.height,
              width: size.width,
              color: Colors.grey,
            ),

            // back arrow button
            Positioned(
              top: AppDimens.mainScaffoldPadding,
              left: AppDimens.mainScaffoldPadding,
              child: BackArrowButton(
                function: () {
                
                }
              ),
            ),

            // bottom button states
            Positioned(
              bottom: AppDimens.mainScaffoldPadding,
              left: AppDimens.mainScaffoldPadding,
              right: AppDimens.mainScaffoldPadding,
              child: BottomElevatedButton(
                label: 'انتخاب مبدا',
                function: () {
                  
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}