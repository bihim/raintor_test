import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/features/event_feed/data/data_source/event_feed_remote_data_source.dart';
import 'package:raintor_test/features/event_feed/data/model/event_model.dart';
import 'package:raintor_test/features/event_feed/domain/repository/event_feed_repository.dart';

class EventFeedRepositoryImp implements EventFeedRepository {
  EventFeedRepositoryImp(this.dataSource);

  final EventFeedRemoteDataSource dataSource;

  @override
  Future<Either<Failure, List<EventModel>>> getEvents() {
    return dataSource.getEvents();
  }
}
