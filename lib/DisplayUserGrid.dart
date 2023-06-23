import 'package:flutter/material.dart';
import 'DisplayUserCard.dart';
import 'model/Profile.dart';
import 'package:intl/intl.dart';

class DisplayUserGrid extends StatelessWidget {
  const DisplayUserGrid({super.key, required this.users});

  final List<Profile> users;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context: context, users: users)));
  }

  List<Widget> _buildGridCards(
      {required BuildContext context, required List<Profile>? users}) {
    if (users == null || users.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    List<Widget> cards = users.map((user) {
      return DisplayUserCard(user: user);
    }).toList();
    return cards;
  }
}
