import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/features/location/data/data_source/location_remote_data_source.dart';
import 'package:raintor_test/features/location/domain/repository/location_repository.dart';

class LocationRepositoryImp implements LocationRepository {
  LocationRepositoryImp(this.dataSource);

  final LocationRemoteDataSource dataSource;

  @override
  Stream<Either<Failure, String>> getUserLocation() {
    return dataSource.getLatLonStream();
  }
}
