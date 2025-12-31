import 'package:boro/core/consts/colors.dart';
import 'package:boro/core/consts/dimens.dart';
import 'package:boro/core/helpers/widget_state_manager.dart';
import 'package:boro/gen/assets.gen.dart';
import 'package:boro/presentation/widgets/icon_buttons/back_arrow_button.dart';
import 'package:boro/presentation/widgets/elevated_buttons/bottom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List currentWidgetList = [CurrentWidgetState.stateSelectOrigin];

  GeoPoint? originPoint;

  GeoPoint? destinationPoint;

  bool isMapReady = false;

  final MapController mapController = MapController(
    initPosition: GeoPoint(
      latitude: 35.7367516373,
      longitude: 51.2911096718,
    ),
  );

  final MarkerIcon originMarker = MarkerIcon(
    iconWidget: SizedBox(
      height: AppDimens.mapMarkerSize,
      width: AppDimens.mapMarkerSize,
      child: SvgPicture.asset(
        Assets.svg.origin,
        fit: .contain,
      ),
    ),
  );

  final MarkerIcon destinationMarker = MarkerIcon(
    iconWidget: SizedBox(
      height: AppDimens.mapMarkerSize,
      width: AppDimens.mapMarkerSize,
      child: SvgPicture.asset(
        Assets.svg.destination,
        fit: .contain,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // ---------------- MAP ----------------
          SizedBox.expand(
            child: OSMFlutter(
              controller: mapController,
              mapIsLoading: const Center(
                child: SpinKitChasingDots(color: AppColors.primary),
              ),
              osmOption: OSMOption(
                zoomOption: ZoomOption(
                  initZoom: 15,
                  maxZoomLevel: 18,
                  minZoomLevel: 6,
                ),
                isPicker: false,
              ),
              onMapIsReady: (isReady) {
                setState(() {
                  isMapReady = isReady;
                });
              },
            ),
          ),
      
          // ---------------- CENTER PICKER ICON ----------------
          isMapReady == true
          ? Align(
            alignment: Alignment.center,
            child: IgnorePointer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    currentWidgetList.last ==
                            CurrentWidgetState.stateSelectOrigin
                        ? Assets.svg.origin
                        : Assets.svg.destination,
                    height: 70,
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ) : const SizedBox.shrink(),
      
          // ---------------- BACK BUTTON ----------------
          isMapReady == true
          ? Positioned(
            top: AppDimens.mainScaffoldPadding * 2,
            left: AppDimens.mainScaffoldPadding,
            child: BackArrowButton(
              function: () {
                onBackPressed();
              },
            ),
          ) : const SizedBox.shrink(),
      
          // ---------------- BOTTOM STATE ----------------
          isMapReady == true
          ? findCurrentWidgetState() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  // BACK BUTTON FUNCTION
  Future<void> onBackPressed() async {
    if (currentWidgetList.length <= 1) return;

    final removedState = currentWidgetList.removeLast();

    if (
        (removedState == CurrentWidgetState.stateSelectDestination ||
        removedState == CurrentWidgetState.stateRequestDriver) &&
        destinationPoint != null
    ) {
      await mapController.removeMarker(destinationPoint!);
      destinationPoint = null;
    }

    if (currentWidgetList.length == 1 &&
        currentWidgetList.first == CurrentWidgetState.stateSelectOrigin &&
        originPoint != null
    ) {
      await mapController.removeMarker(originPoint!);
      originPoint = null;
    }

    setState(() {});
  }

  // BUTTON STATES
  Widget findCurrentWidgetState() {
    switch (currentWidgetList.last) {
      case CurrentWidgetState.stateSelectOrigin:
        return originState();
      case CurrentWidgetState.stateSelectDestination:
        return destinationState();
      case CurrentWidgetState.stateRequestDriver:
        return reqDriverState();
      default:
        return originState();
    }
  }

  // ORIGIN
  Positioned originState() {
    return Positioned(
      bottom: AppDimens.mainScaffoldPadding,
      left: AppDimens.mainScaffoldPadding,
      right: AppDimens.mainScaffoldPadding,
      child: BottomElevatedButton(
        label: 'انتخاب مبدا',
        function: () async {
          final point = await mapController.centerMap;

          originPoint = point;

          await mapController.removeMarker(point);
          await mapController.addMarker(
            point,
            markerIcon: originMarker,
          );

          setState(() {
            currentWidgetList.add(
              CurrentWidgetState.stateSelectDestination,
            );
          });
        },
      ),
    );
  }

  // DESTINATION
  Positioned destinationState() {
    return Positioned(
      bottom: AppDimens.mainScaffoldPadding,
      left: AppDimens.mainScaffoldPadding,
      right: AppDimens.mainScaffoldPadding,
      child: BottomElevatedButton(
        label: 'انتخاب مقصد',
        function: () async {
          final point = await mapController.centerMap;

          destinationPoint = point;

          await mapController.addMarker(
            point,
            markerIcon: destinationMarker,
          );

          setState(() {
            currentWidgetList.add(
              CurrentWidgetState.stateRequestDriver,
            );
          });
        },
      ),
    );
  }

  // REQUEST DRIVER
  Positioned reqDriverState() {
    return Positioned(
      bottom: AppDimens.mainScaffoldPadding,
      left: AppDimens.mainScaffoldPadding,
      right: AppDimens.mainScaffoldPadding,
      child: BottomElevatedButton(
        label: 'درخواست راننده',
        function: () {
          debugPrint('Origin: $originPoint');
          debugPrint('Destination: $destinationPoint');
        },
      ),
    );
  }
}