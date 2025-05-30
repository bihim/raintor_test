import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/features/event_feed/data/model/event_model.dart';
import 'package:raintor_test/features/event_feed/domain/repository/event_feed_repository.dart';

class EventUsecase {
  final EventFeedRepository repository;

  EventUsecase(this.repository);

  Future<Either<Failure, List<EventModel>>> getEvents() =>
      repository.getEvents();
}
