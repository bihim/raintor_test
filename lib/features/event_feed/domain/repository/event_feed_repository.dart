import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/features/event_feed/data/model/event_model.dart';

mixin  EventFeedRepository {
  Future<Either<Failure, List<EventModel>>> getEvents();
}