import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/widgets/delete_button_widget.dart';
import 'package:rentmylove/widgets/single_date_picker_widget.dart';

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
              TextFieldWidget(width: screenWidth, inputType: TextInputType.text, initialText: "hello",),
              const Text('จำนวนเงิน (บาท)', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              TextFieldWidget(width: screenWidth, inputType: TextInputType.number, initialText: "50",),
              const Text('วัน/เดือน/ปี', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              // calendar
              SingleDatePickerWidget(date: _date),
              const Text('หมายเหตุ', style: RmlTextStyle.normalText),
              const SizedBox(height: 5),
              //multiline text field
              SizedBox(
                height: 100,
                child: TextFormField(
                  initialValue:"hello",
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
