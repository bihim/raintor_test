import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raintor_test/config/helper/helper.dart';
import 'package:raintor_test/config/shared/info_screen.dart';
import 'package:raintor_test/features/event_feed/data/model/event_model.dart';
import 'package:raintor_test/features/event_feed/presentation/provider/event_provider.dart';

class EventFeedBody extends ConsumerStatefulWidget {
  const EventFeedBody({super.key});

  @override
  ConsumerState<EventFeedBody> createState() => _EventFeedBodyState();
}

class _EventFeedBodyState extends ConsumerState<EventFeedBody> {
  final _scrollController = ScrollController();
  final _models = <EventModel>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getEventsProvider(context: context).future).then((value) {
        setState(() {
          _models.addAll(value);
          logger.d(_models.length);
        });
      });
    });
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      // Reached near the bottom (adjust threshold as needed)
      ref.read(listOfEventsProvider.notifier).getNextEvents(models: _models);
    }
  }

  @override
  Widget build(BuildContext context) {
    final listOfEvents = ref.watch(listOfEventsProvider);
    final isLoading = ref.watch(isLoadingProvider);
    return listOfEvents == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : (listOfEvents.isEmpty
            ? const InfoScreen(
                title: 'No Events',
                icon: Icons.event,
              )
            : Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        ref.read(listOfEventsProvider.notifier).setNull();
                        await ref.refresh(
                          getEventsProvider(context: context).future,
                        );
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: listOfEvents.length,
                        itemBuilder: (context, index) {
                          final data = listOfEvents[index];
                          return Card(
                            elevation: 0,
                            child: ListTile(
                              title: Text(data.title ?? ''),
                              subtitle: Text(data.body ?? ''),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (isLoading)
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: const CircularProgressIndicator(),
                    ),
                ],
              ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
