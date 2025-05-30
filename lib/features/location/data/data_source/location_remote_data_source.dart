import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:raintor_test/config/di/injector.dart';
import 'package:raintor_test/config/failure/failure.dart';
import 'package:raintor_test/config/network/api_urls.dart';
import 'package:signalr_core/signalr_core.dart';

class LocationRemoteDataSource {
  final _connection = getIt<HubConnection>();
  final StreamController<Either<Failure, String>> _controller =
      StreamController.broadcast();

  Stream<Either<Failure, String>> getLatLonStream() {
    _connection.on('ReceiveLatLon', (message) {
      try {
        if (message != null && message.isNotEmpty) {
          final data = message.first.toString();
          _controller.add(Right(data));
        } else {
          _controller.add(Left(Failure(message: 'Received empty message')));
        }
      } catch (e) {
        _controller.add(Left(Failure(message: e.toString())));
      }
    });

    _connection.start()/*?.catchError((error) {
      _controller.add(Left(Failure(message: error.toString())));
    })*/;
    return _controller.stream;
  }
}
