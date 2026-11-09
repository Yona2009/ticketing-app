
import 'package:flutter/material.dart';

import 'package:ticketing_app/screens/shared/glass_placeholder.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlassPlaceholder(
      title: 'Your Profile',
      subtitle: 'Manage your account and personal information.',
      icon: Icons.person_outline_rounded,
    );
  }
}
