import 'package:flutter/material.dart';
import 'package:first_project/utils/GridTiles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhotosScreenState();
  }
}

class PhotosScreenState extends State<PhotosScreen> {
  List<StaggeredTile> staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(4, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(3, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 1),
  ];

  List<Widget> tiles = const <Widget>[
    const GridTiles(Colors.green, Icons.widgets, "Widget"),
    const GridTiles(Colors.lightBlue, Icons.wifi, "Wifi"),
    const GridTiles(
        Colors.amber, Icons.panorama_wide_angle, "Panorama Wide Angle"),
    const GridTiles(Colors.brown, Icons.map, "Map"),
    const GridTiles(Colors.deepOrange, Icons.send, "Send"),
    const GridTiles(Colors.indigo, Icons.airline_seat_flat, " Flat"),
    const GridTiles(Colors.red, Icons.bluetooth, "Bluetooth"),
    const GridTiles(Colors.pink, Icons.battery_alert, "Battery"),
    const GridTiles(Colors.purple, Icons.desktop_windows, "Windows"),
    const GridTiles(Colors.blue, Icons.radio, "Radio"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: new StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: staggeredTiles,
          children: tiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        ),
      ),
    );
  }
}
