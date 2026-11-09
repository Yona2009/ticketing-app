
import 'package:flutter/material.dart';
import 'package:ticketing_app/models/event_data.dart';

const List<CategoryData> categories = [
  CategoryData('All', Icons.grid_view_rounded),
  CategoryData('Music', Icons.music_note_rounded),
  CategoryData('Festival', Icons.celebration_outlined),
  CategoryData('Sports', Icons.sports_basketball_outlined),
  CategoryData('Comedy', Icons.mic_none_rounded),
  CategoryData('Arts', Icons.palette_outlined),
];

const List<EventData> featuredEvents = [
  EventData(
    id: 'f1',
    title: 'The Sound of Gold',
    category: 'Music',
    date: '20 December 2026',
    location: 'Gelora Bung Karno, Jakarta',
    description:
        'An extraordinary night of music with a full orchestra, live visuals and surprise guest performers. Doors open at 6 PM.',
    price: 750000,
    icon: Icons.music_note_rounded,
    colors: [
      Color(0xFF7A5E2E),
      Color(0xFF2B2113),
      Color(0xFF111111),
    ],
  ),
  EventData(
    id: 'f2',
    title: 'Neon Skyline Live',
    category: 'Music',
    date: '3 January 2027',
    location: 'Ancol Beach City, Jakarta',
    description:
        'Electronic artists take over the waterfront for a night of lights, bass and sunrise sets.',
    price: 550000,
    icon: Icons.graphic_eq_rounded,
    colors: [
      Color(0xFF6B3F22),
      Color(0xFF241610),
      Color(0xFF101010),
    ],
  ),
  EventData(
    id: 'f3',
    title: 'Velvet Jazz Evenings',
    category: 'Music',
    date: '9 January 2027',
    location: 'Teater Jakarta, TIM',
    description:
        'Three nights of live jazz in an intimate hall. Limited seating, dress code smart casual.',
    price: 400000,
    icon: Icons.piano_rounded,
    colors: [
      Color(0xFF5A4A2A),
      Color(0xFF1F1A11),
      Color(0xFF0F0F0F),
    ],
  ),
];

const List<EventData> allEvents = [
  EventData(
    id: 'e1',
    title: 'The Grand Music Festival',
    category: 'Festival',
    date: '22 December 2026',
    location: 'Jakarta International Stadium',
    description:
        'Two stages, over 30 artists and a food court with local favorites. A full day of music under the open sky.',
    price: 350000,
    icon: Icons.graphic_eq_rounded,
    colors: [
      Color(0xFF66502A),
      Color(0xFF211B12),
    ],
  ),
  EventData(
    id: 'e2',
    title: 'Golden Night Concert',
    category: 'Music',
    date: '28 December 2026',
    location: 'Indonesia Arena, Jakarta',
    description:
        'A golden evening with chart-topping artists performing their biggest hits, backed by a live band.',
    price: 450000,
    icon: Icons.music_note_rounded,
    colors: [
      Color(0xFF6B5326),
      Color(0xFF1F1910),
    ],
  ),
  EventData(
    id: 'e3',
    title: 'Midnight Acoustic Sessions',
    category: 'Music',
    date: '15 January 2027',
    location: 'Taman Ismail Marzuki, Jakarta',
    description:
        'Stripped-back sets from independent artists in a candle-lit open-air venue.',
    price: 200000,
    icon: Icons.queue_music_rounded,
    colors: [
      Color(0xFF5E4426),
      Color(0xFF1D160F),
    ],
  ),
  EventData(
    id: 'e4',
    title: 'Laugh Out Loud Night',
    category: 'Comedy',
    date: '5 January 2027',
    location: 'Balai Sarbini, Jakarta',
    description:
        'The best stand-up comedians in the country share one stage for a night of laughs.',
    price: 250000,
    icon: Icons.mic_none_rounded,
    colors: [
      Color(0xFF6A4A2C),
      Color(0xFF211810),
    ],
  ),
  EventData(
    id: 'e5',
    title: 'Jakarta Basketball Showdown',
    category: 'Sports',
    date: '12 January 2027',
    location: 'Istora Senayan, Jakarta',
    description:
        'Top teams face off in the season showdown. Includes halftime performances and fan zone.',
    price: 300000,
    icon: Icons.sports_basketball_outlined,
    colors: [
      Color(0xFF6E4B25),
      Color(0xFF211710),
    ],
  ),
  EventData(
    id: 'e6',
    title: 'Lumina Art Expo',
    category: 'Arts',
    date: '18 January 2027',
    location: 'Museum MACAN, Jakarta',
    description:
        'Immersive light installations and contemporary works from 40 artists across Southeast Asia.',
    price: 175000,
    icon: Icons.palette_outlined,
    colors: [
      Color(0xFF5C4B2D),
      Color(0xFF1E1810),
    ],
  ),
];
