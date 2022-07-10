import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../core/errors/failure.dart';

class LocationRepository {
  LocationRepository();

  Future<Either<Failure, LatLng>> getCurrentLocation() async {
    final location = Location();

    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final isEnabled = await location.requestService();
      if (!isEnabled) {
        return Left(PermissionsFailure());
      }
    }

    final permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      final status = await location.requestPermission();
      if (status != PermissionStatus.granted) {
        return Left(PermissionsFailure());
      }
    }

    late final LocationData locationData;
    try {
      locationData = await location.getLocation();
    } catch (_) {
      return Left(LocationFailure());
    }

    final latitude = locationData.latitude;
    final longitude = locationData.longitude;

    if (latitude == null || longitude == null) {
      return Left(LocationFailure());
    }

    return Right(LatLng(latitude, longitude));
  }
}
