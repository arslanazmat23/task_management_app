import 'package:flutter/material.dart';
import 'package:task_management_app/modals/Task_modal.dart';
import 'package:task_management_app/widgets/TaskTimeLine.dart';
import 'package:task_management_app/widgets/task_title.dart';

import 'datePicker.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  DetailPage (this.task);

  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                
                ),
               ),
               child: Column(                       //const lagao to error hai
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DatePicker(), TaskTitle(),
                ],
               ),
            ),
          ),
          detailList == null
           ?SliverFillRemaining(
            child: Container(
              color: Colors.white,
              height: 200,
              child: const Center(
                child: Text(
                   "No task selected",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
          :SliverList(delegate: SliverChildBuilderDelegate((context,index)
          => TaskTimeLine(detailList[index]), childCount: detailList.length)),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: 90,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
        iconSize: 20,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
          iconSize: 20,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${task.title} Task',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'You have ${task.left} Task left to do',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
