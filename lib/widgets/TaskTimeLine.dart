import 'package:flutter/material.dart';

class TaskTimeLine  extends StatelessWidget {
  final Map<String, dynamic> detail;
  TaskTimeLine (this.detail);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15
      ),

     child: Row(), 

    );
  }
  Widget _buildTimeLine(Color color){
    return Container(
      width: 20,
      height: 115,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}