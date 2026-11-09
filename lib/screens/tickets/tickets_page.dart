
import 'package:flutter/material.dart';

import 'package:ticketing_app/screens/shared/glass_placeholder.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassPlaceholder(
      title: 'My Tickets',
      subtitle: 'Your purchased tickets will appear here.',
      icon: Icons.confirmation_number_outlined,
    );
  }
}
