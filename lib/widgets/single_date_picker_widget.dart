import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleDatePickerWidget extends StatefulWidget {
  DateTime date;
  SingleDatePickerWidget({required this.date});

  @override
  State<SingleDatePickerWidget> createState() => _SingleDatePickerWidgetState();
}

class _SingleDatePickerWidgetState extends State<SingleDatePickerWidget> {
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
    border: Border.all(),
    borderRadius: BorderRadius.circular(12),
    color: Colors.white
    ),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${widget.date.day}/${widget.date.month}/${widget.date.year}"),
        IconButton(
          onPressed: () {
            _showDialog(
                CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  // This shows day of week alongside day of month
                  showDayOfWeek: true,
                  // This is called when the user changes the date.
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() => widget.date = newDate);
                  },
                )
            );
          },
          icon: Icon(Icons.calendar_month_rounded),
        ),
      ],
    )
    );;
  }
}
