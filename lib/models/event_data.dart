
import 'package:flutter/material.dart';

class EventData {
  final String id;
  final String title;
  final String category;
  final String date;
  final String location;
  final String description;
  final int price;
  final IconData icon;
  final List<Color> colors;

  const EventData({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.location,
    required this.description,
    required this.price,
    required this.icon,
    required this.colors,
  });
}

class CategoryData {
  final String label;
  final IconData icon;

  const CategoryData(this.label, this.icon);
}
