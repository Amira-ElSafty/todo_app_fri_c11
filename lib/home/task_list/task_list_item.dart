import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const DrawerMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              onPressed: (context) {
                /// delete task
              },
              backgroundColor: AppColors.redColor,
              foregroundColor: AppColors.whiteColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          // margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                color: AppColors.primaryColor,
                height: MediaQuery.of(context).size.height * 0.1,
                width: 3,
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Title',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    'Des',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              )),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.check,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
