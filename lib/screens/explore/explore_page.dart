
import 'package:flutter/material.dart';

import 'package:ticketing_app/screens/shared/glass_placeholder.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassPlaceholder(
      title: 'Explore',
      subtitle: 'Discover more events and experiences.',
      icon: Icons.explore_outlined,
    );
  }
}
