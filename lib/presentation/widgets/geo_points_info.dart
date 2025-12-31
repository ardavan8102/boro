import 'package:flutter/material.dart';

class GeoPointsInformationCard extends StatelessWidget {
  const GeoPointsInformationCard({
    super.key,
    required this.distance,
    required this.originAddress,
    required this.destinationAddress,
  });

  final String distance;
  final String originAddress;
  final String destinationAddress;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    var textTheme = Theme.of(context).textTheme;
    
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(12)
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            distance,
            style: textTheme.labelMedium,
          ),

          Text(
            originAddress,
            style: textTheme.labelMedium,
          ),

          Text(
            destinationAddress,
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}