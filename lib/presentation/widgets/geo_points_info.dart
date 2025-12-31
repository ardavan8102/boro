import 'package:flutter/material.dart';

class GeoPointsInformationCard extends StatelessWidget {
  const GeoPointsInformationCard({
    super.key,
    required this.distance,
  });

  final String distance;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    var textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: size.width,
      height: size.height * .1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12)
      ),
      child: Center(
        child: Text(
          distance,
          style: textTheme.labelMedium,
        )
      ),
    );
  }
}