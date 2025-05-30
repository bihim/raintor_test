import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

@riverpod
Future<bool> getLocationPermission(Ref ref,
    {required BuildContext context}) async {
  final status = await Permission.location.status;
  // If already granted
  if (status.isGranted) return true;
  // Request permission
  final result = await Permission.location.request();
  if (result.isGranted) {
    return true;
  } else if (result.isPermanentlyDenied) {
    // Show dialog and redirect to app settings
    if (!context.mounted) {
      return false;
    }
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: const Text(
          'Location permission is permanently denied. Please enable it from settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              context.pop();
              await openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
    return false;
  } else {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permission is denied.'),
        ),
      );
    });
    return false;
  }
}

