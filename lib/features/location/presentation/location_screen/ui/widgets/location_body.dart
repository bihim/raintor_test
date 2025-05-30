import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:raintor_test/config/di/injector.dart';
import 'package:raintor_test/config/helper/helper.dart';
import 'package:raintor_test/config/shared/info_screen.dart';
import 'package:raintor_test/features/location/data/model/location_model.dart';
import 'package:raintor_test/features/location/domain/use_case/location_usecase.dart';
import 'package:raintor_test/features/location/presentation/provider/location_provider.dart';
import 'package:signalr_core/signalr_core.dart' as signalr;

class LocationBody extends ConsumerStatefulWidget {
  const LocationBody({super.key});

  @override
  ConsumerState<LocationBody> createState() => _LocationBodyState();
}

class _LocationBodyState extends ConsumerState<LocationBody> {
  bool? _isPermissionGranted;

  @override
  void initState() {
    ref
        .read(
      getLocationPermissionProvider(context: context).future,
    )
        .then((value) {
      setState(() {
        _isPermissionGranted = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isPermissionGranted == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (_isPermissionGranted!
            ? const GoogleMapLocationShow()
            : InfoScreen(
                title: 'Location Permission',
                description:
                    'Location permission is required to use the feature.',
                iconWidget: ElevatedButton.icon(
                  icon: Icon(
                    Icons.refresh,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () async {
                    final value = await ref.read(
                        getLocationPermissionProvider(context: context).future);
                    if (value) {
                      setState(() {
                        _isPermissionGranted = value;
                      });
                    }
                  },
                  label: const Text(
                    'Try Again',
                  ),
                ),
              ));
  }
}

class GoogleMapLocationShow extends StatefulWidget {
  const GoogleMapLocationShow({super.key});

  @override
  State<GoogleMapLocationShow> createState() => _GoogleMapLocationShowState();
}

class _GoogleMapLocationShowState extends State<GoogleMapLocationShow> {
  GoogleMapController? _mapController;
  final Map<MarkerId, Marker> _markers = {};
  final MarkerId _markerId = MarkerId('live_marker');

  @override
  void initState() {
    sendLocation();
    super.initState();
  }

  Future<void> sendLocation() async {
    final connection = getIt<signalr.HubConnection>();
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    )).listen((Position? position) async {
      if (position != null) {
        await connection.invoke(
          'SendLatLon',
          args: [
            '{latitude:${position.latitude},longitude:${position.longitude}, userName:zubaerbihim@gmail.com}',
          ],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt<LocationUseCase>().getUserLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return InfoScreen(
            title: 'Location Error',
            description: snapshot.error.toString(),
          );
        }
        if (snapshot.hasData) {
          return snapshot.data!.fold(
            (left) {
              return InfoScreen(
                title: 'Location Error',
                description: left.message,
              );
            },
            (right) {
              try {
                final model = LocationModel.fromJson(
                  jsonDecode(convertToJsonString(right))
                      as Map<String, dynamic>,
                );
                return mapShow(
                  model: model,
                );
              } catch (e) {
                return InfoScreen(
                  title: 'Location Error',
                  description: e.toString(),
                );
              }
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget mapShow({
    required LocationModel model,
  }) {
    final latLon = LatLng(
      model.lat ?? 0.0,
      model.lon ?? 0.0,
    );
    _updateMarker(latLon, model.userName ?? '');
    _moveCamera(latLon);
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(0, 0),
        zoom: 2,
      ),
      markers: Set<Marker>.of(_markers.values),
      onMapCreated: (controller) {
        _mapController = controller;
      },
    );
  }

  void _updateMarker(LatLng position, String markerId) {
    final marker = Marker(
      markerId: _markerId,
      position: position,
      infoWindow: InfoWindow(title: markerId),
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _markers[_markerId] = marker;
      });
    });
  }

  void _moveCamera(LatLng position) {
    _mapController?.animateCamera(
      CameraUpdate.newLatLng(position),
    );
  }
}
