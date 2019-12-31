import 'package:flutter/material.dart';

class ScrambleIcon extends StatelessWidget {
  final IconData icon;
  final String currentId;
  final String id;
  final Function(String id) onClick;
  ScrambleIcon(this.currentId,this.id,this.icon,this.onClick);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(id);
      },
      child: Icon(
        icon,
        size: 40,
        color: currentId==id ? Theme.of(context).textTheme.body1.color : Theme.of(context).disabledColor,
      ),
    );
  }
}
