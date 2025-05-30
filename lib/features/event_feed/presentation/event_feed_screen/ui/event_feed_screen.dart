import 'package:flutter/material.dart';
import 'package:raintor_test/features/event_feed/presentation/event_feed_screen/ui/widgets/event_feed_body.dart';

class EventFeedScreen extends StatelessWidget {
  const EventFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: EventFeedBody());
  }
}
