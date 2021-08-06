import 'package:flutter/material.dart';
import 'package:makhanerush/models/sidebar.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({@required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 42.0,
            height: 42.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                gradient: item.background),
            child: item.icon),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                item.title,
                //style: kCalloutLabelStyle.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                item.subtitle,
                //style: kCalloutLabelStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 13),
              ),
            )
          ],
        ),
      ],
    );
  }
}
