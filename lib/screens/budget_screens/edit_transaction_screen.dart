import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/widgets/delete_button_widget.dart';

import '../../color_preset.dart';
import '../../text_style.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/save_button_widget.dart';
import '../../widgets/text_field.dart';

class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({super.key});

  @override
  State<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  DateTime _date = DateTime.now();

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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: wallpaper,
        appBar: const CustomAppBar(),
        body: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child:
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const Text(
                'เเก้รายจ่าย',
                style: RmlTextStyle.title,
              ),
              const SizedBox(height: 10),
              const Text('รายการ', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              TextFieldWidget(width: screenWidth, inputType: TextInputType.text,),
              const Text('จำนวนเงิน (บาท)', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              TextFieldWidget(width: screenWidth, inputType: TextInputType.number,),
              const Text('วัน/เดือน/ปี', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              // calendar
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${_date.day}/${_date.month}/${_date.year}"),
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
                                setState(() => _date = newDate);
                              },
                            )
                        );
                      },
                      icon: Icon(Icons.calendar_month_rounded),
                    ),
                  ],
                ),
              ),
              const Text('หมายเหตุ', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              //multiline text field
              SizedBox(
                height: 100,
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      // contentPadding: const EdgeInsets.fromLTRB(12, 3, 12, 8),
                    ),
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    textAlignVertical: TextAlignVertical.top
                ),
              ),
              SizedBox(height: 90,),
              DeleteButtonWidget(tapFunc: () {},),
              SizedBox(height: 10,),
              SaveButtonWidget(
                tapFunc:
                    () {},
              ),
            ],
          ),
        )
    );
  }
}
