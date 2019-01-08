import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// GridTiles is used to show tiles in Photos screen with Icon and Background Color.
class GridTiles extends StatelessWidget {
  const GridTiles(this.backgroundColor, this.iconData, this.tilesName);

  final Color backgroundColor;
  final IconData iconData;
  final String tilesName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: tilesName);
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
