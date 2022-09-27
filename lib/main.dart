import 'package:flutter/material.dart';

import 'items/heading_item.dart';
import 'items/list_item.dart';
import 'items/message_item.dart';
import 'tutorial_flutter.dart';

void main() {
  runApp(
    TutorialFlutter(
      items: List<ListItem>.generate(
        50,
        (i) => i % 6 == 0
            ? HeadingItem('Heading $i')
            : MessageItem('Sender $i', 'Message body $i'),
      ),
    ),
  );
}
