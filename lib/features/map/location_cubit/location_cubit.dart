import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/errors/failure.dart';
import '../../../data/repositories/location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository locationRepository;

  LocationCubit({
    required this.locationRepository,
  }) : super(LocationInitial());

  Future<void> getUserLocation() async {
    emit(LocationLoadInProgress());
    final failureOrLatLng = await locationRepository.getCurrentLocation();
    failureOrLatLng.fold(
      (failure) => emit(LocationLoadFailure(mapFailureToMessage(failure))),
      (latLng) => emit(LocationLoadSuccess(latLng)),
    );
  }
}
