import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';

mixin LocationRepository {
  Stream<Either<Failure, String>> getUserLocation();
}