part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoadInProgress extends LocationState {}

class LocationLoadSuccess extends LocationState {
  final LatLng latLng;
  const LocationLoadSuccess(this.latLng);

  @override
  List<Object> get props => [latLng];
}

class LocationLoadFailure extends LocationState {
  final String message;
  const LocationLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
