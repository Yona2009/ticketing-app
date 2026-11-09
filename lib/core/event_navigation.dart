
import 'package:flutter/cupertino.dart';

import 'package:ticketing_app/models/event_data.dart';
import 'package:ticketing_app/screens/event_detail/event_detail_page.dart';

void openEvent(BuildContext context, EventData event) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      builder: (_) => EventDetailPage(event: event),
    ),
  );
}
