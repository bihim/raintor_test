import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/features/location/domain/repository/location_repository.dart';

class LocationUseCase {
  LocationUseCase(this.repository);

  final LocationRepository repository;

  Stream<Either<Failure, String>> getUserLocation() {
    return repository.getUserLocation();
  }
}
