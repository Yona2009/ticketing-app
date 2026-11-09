
import 'package:flutter/material.dart';

import 'package:ticketing_app/core/constants.dart';
import 'package:ticketing_app/models/event_data.dart';
import 'package:ticketing_app/widgets/glass_widgets.dart';

class EventDetailPage extends StatefulWidget {
  final EventData event;

  const EventDetailPage({
    super.key,
    required this.event,
  });

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  int _quantity = 1;

  int get _totalPrice => widget.event.price * _quantity;

  void _changeQuantity(int amount) {
    final nextQuantity = _quantity + amount;

    if (nextQuantity < 1 || nextQuantity > 6) return;

    setState(() {
      _quantity = nextQuantity;
    });
  }

  void _showOrderConfirmation() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: surfaceColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text(
            'Order placed',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          content: const Text(
            'Your order has been recorded as a demo. '
            'Payment and ticket generation are not connected yet.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: goldColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: _buildHero(event),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 25, 22, 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategory(event),
                      const SizedBox(height: 13),
                      Text(
                        event.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          height: 1.12,
                          letterSpacing: -0.8,
                        ),
                      ),
                      const SizedBox(height: 22),
                      _buildInformation(event),
                      const SizedBox(height: 30),
                      _buildAbout(event),
                      const SizedBox(height: 30),
                      _buildTicketSelector(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildHero(EventData event) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: event.colors,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: 85,
            child: Icon(
              event.icon,
              size: 220,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 340,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.35),
                    Colors.transparent,
                    backgroundColor,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.paddingOf(context).top + 12,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlassIconButton(
                  icon: Icons.arrow_back_rounded,
                  onTap: () => Navigator.pop(context),
                ),
                GlassIconButton(
                  icon: Icons.favorite_border_rounded,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 22,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: goldColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                event.category.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(EventData event) {
    return Row(
      children: [
        const Icon(
          Icons.local_activity_outlined,
          color: goldColor,
          size: 16,
        ),
        const SizedBox(width: 7),
        Text(
          event.category.toUpperCase(),
          style: const TextStyle(
            color: goldColor,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildInformation(EventData event) {
    return Column(
      children: [
        _InfoTile(
          icon: Icons.calendar_month_rounded,
          title: 'Date',
          value: event.date,
        ),
        const SizedBox(height: 12),
        _InfoTile(
          icon: Icons.location_on_outlined,
          title: 'Location',
          value: event.location,
        ),
      ],
    );
  }

  Widget _buildAbout(EventData event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Event',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          event.description,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.58),
            fontSize: 13,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  Widget _buildTicketSelector() {
    return GlassCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Tickets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 17),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Ticket quantity',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ),
              _quantityButton(
                icon: Icons.remove_rounded,
                onTap: () => _changeQuantity(-1),
              ),
              SizedBox(
                width: 45,
                child: Center(
                  child: Text(
                    '$_quantity',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              _quantityButton(
                icon: Icons.add_rounded,
                onTap: () => _changeQuantity(1),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Divider(
            color: Colors.white.withValues(alpha: 0.10),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Price per ticket',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                formatRupiah(widget.event.price),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                formatRupiah(_totalPrice),
                style: const TextStyle(
                  color: lightGoldColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GlassIconButton(
      icon: icon,
      size: 36,
      iconColor: goldColor,
      onTap: onTap,
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          22,
          16,
          22,
          MediaQuery.paddingOf(context).bottom + 18,
        ),
        decoration: BoxDecoration(
          color: backgroundColor.withValues(alpha: 0.96),
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Total price',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRupiah(_totalPrice),
                    style: const TextStyle(
                      color: lightGoldColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 155,
              child: GoldButton(
                label: 'Book Ticket',
                icon: Icons.arrow_forward_rounded,
                onPressed: _showOrderConfirmation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(15),
      radius: 18,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: goldColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: goldColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
