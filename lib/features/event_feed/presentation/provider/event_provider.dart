import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raintor_test/config/di/injector.dart';
import 'package:raintor_test/config/helper/helper.dart';
import 'package:raintor_test/features/event_feed/data/model/event_model.dart';
import 'package:raintor_test/features/event_feed/domain/use_case/event_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_provider.g.dart';

@riverpod
class ListOfEvents extends _$ListOfEvents {
  @override
  List<EventModel>? build() {
    return null;
  }

  void setEvents(List<EventModel> eventModel) {
    state = eventModel;
  }

  void setNull() {
    state = null;
  }

  Future<void> getNextEvents({required List<EventModel> models}) async {
    final alreadyLoaded = state?.length ?? 0;

    // Stop loading if we've already loaded all items
    if (alreadyLoaded >= models.length) {
      state = [...models];
      return;
    }

    // Get the next chunk of items
    final nextChunk = models.skip(alreadyLoaded).take(10).toList();

    ref.read(isLoadingProvider.notifier).setIsLoading(isLoading: true);
    await Future.delayed(const Duration(seconds: 1), () {});
    ref.read(isLoadingProvider.notifier).setIsLoading(isLoading: false);

    state = [...state ?? [], ...nextChunk];
  }
}

@riverpod
class IsLoading extends _$IsLoading {
  @override
  bool build() {
    return false;
  }

  void setIsLoading({required bool isLoading}) {
    state = isLoading;
  }
}

@riverpod
Future<List<EventModel>> getEvents(Ref ref,
    {required BuildContext context}) async {
  final eventUseCase = await getIt<EventUsecase>().getEvents();
  final events = <EventModel>[];
  eventUseCase.fold(
    (left) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(left.message),
        ),
      );
    },
    (right) {
      events.addAll(right);
      ref
          .read(listOfEventsProvider.notifier)
          .setEvents(right.take(10).toList());
    },
  );
  return events;
}
