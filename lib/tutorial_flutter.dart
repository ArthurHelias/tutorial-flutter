import 'package:flutter/material.dart';

import 'items/list_item.dart';

class TutorialFlutter extends StatelessWidget {
  final List<ListItem> items;

  const TutorialFlutter({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Test List View';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ),
      ),
    );
  }
}