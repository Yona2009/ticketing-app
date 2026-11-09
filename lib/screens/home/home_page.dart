
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ticketing_app/core/constants.dart';
import 'package:ticketing_app/data/event_data_source.dart';
import 'package:ticketing_app/models/event_data.dart';
import 'package:ticketing_app/widgets/event_widgets.dart';
import 'package:ticketing_app/widgets/glass_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  List<EventData> get _filteredEvents {
    return allEvents.where((event) {
      final matchesCategory = _selectedCategory == 'All' ||
          event.category == _selectedCategory;

      final query = _searchQuery.toLowerCase();

      final matchesSearch = event.title.toLowerCase().contains(query) ||
          event.category.toLowerCase().contains(query) ||
          event.location.toLowerCase().contains(query);

      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AmbientBackground(
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),
            SliverToBoxAdapter(
              child: _buildIntroduction(),
            ),
            SliverToBoxAdapter(
              child: _buildSearch(),
            ),
            SliverToBoxAdapter(
              child: _buildFeaturedSection(),
            ),
            SliverToBoxAdapter(
              child: _buildCategorySection(),
            ),
            SliverToBoxAdapter(
              child: _buildPopularHeader(),
            ),
            _buildEventGrid(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 120),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 14, 22, 22),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [lightGoldColor, bronzeColor],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.confirmation_number_rounded,
              color: Colors.black,
              size: 23,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TICKETING',
                style: TextStyle(
                  color: goldColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Your next experience starts here',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const Spacer(),
          GlassIconButton(
            icon: Icons.notifications_none_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildIntroduction() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 5, 22, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: largeTitleStyle,
          ),
          const SizedBox(height: 8),
          Text(
            'Find your next unforgettable experience.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.52),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            height: 54,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.09),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  color: goldColor,
                  size: 21,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search events, artists, venues...',
                      hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.35),
                        fontSize: 12,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SectionHeader(
            title: 'Featured Event',
            subtitle: 'Handpicked experiences for you',
          ),
        ),
        const SizedBox(height: 17),
        SizedBox(
          height: 365,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: featuredEvents.length,
            separatorBuilder: (_, _) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return FeaturedCard(
                event: featuredEvents[index],
              );
            },
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: SectionHeader(
            title: 'Categories',
            subtitle: 'Explore events by interest',
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 43,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 9),
            itemBuilder: (context, index) {
              final category = categories[index];

              return CategoryPill(
                category: category,
                selected: _selectedCategory == category.label,
                onTap: () {
                  setState(() {
                    _selectedCategory = category.label;
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildPopularHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 17),
      child: SectionHeader(
        title: 'Popular Events',
        subtitle: 'Events you might love',
        actionLabel: 'See all',
        onAction: () {
          setState(() {
            _selectedCategory = 'All';
            _searchQuery = '';
          });
        },
      ),
    );
  }

  Widget _buildEventGrid() {
    final events = _filteredEvents;

    if (events.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 45),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.search_off_rounded,
                  size: 42,
                  color: Colors.white38,
                ),
                SizedBox(height: 12),
                Text(
                  'No events found',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Try another keyword or category.',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return EventCard(
              event: events[index],
            );
          },
          childCount: events.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 12,
          mainAxisExtent: 285,
        ),
      ),
    );
  }
}
