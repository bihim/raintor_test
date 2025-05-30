import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/config/helper/helper.dart';
import 'package:raintor_test/config/network/api_service.dart';
import 'package:raintor_test/config/network/api_urls.dart';
import 'package:raintor_test/features/event_feed/data/model/event_model.dart';

class EventFeedRemoteDataSource {
  Future<Either<Failure, List<EventModel>>> getEvents() async {
    final getEvents = ApiService.get(ApiUrls.eventUrl);
    final response = await getEvents;
    if (response.statusCode == 200) {
      try {
        final events = eventModelFromJson(response.data.toString());
        return Right(events);
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(Failure(message: 'Server Failure'));
    }
  }
}
