import 'dart:io';

import 'package:flutter/material.dart';

class SidebarItem {
  SidebarItem({this.title, this.subtitle, this.background, this.icon});

  String title;
  String subtitle;
  LinearGradient background;
  Icon icon;
}

var sidebarItem = [
  SidebarItem(
    title: "I miei dati",
    subtitle: "modifica i dati inseriti inizialmente",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      //colors: [kBlueMainColor, kBlueMainColor]
),
    icon: Icon(
      Icons.account_circle,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Resetta",
    subtitle: "ricomincia il quiz",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      //colors: [kBlueMainColor, kBlueMainColor],
    ),
    icon: Icon(
      Icons.update,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Termina",
    subtitle: "concludi il questionario",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      //colors: [kBlueMainColor, kBlueMainColor],
    ),
    icon: Icon(
      Icons.send,
      color: Colors.white,
    ),
  ),
];
