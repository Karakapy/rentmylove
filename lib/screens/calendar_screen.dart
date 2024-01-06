import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/screens/add_order_screen.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/nav_bar_widget.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:rentmylove/widgets/order_card_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late DateTime selectedDate;
  late List<Task> taskList = [];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    taskList = _getDataSource();
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AddOrderScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: Spacer(),
      title: const Text(
        "ออเดอร์",
        style: RmlTextStyle.sectionTitle,
      ),
      actions: [
        IconButton(onPressed: () {
          setState(() {
            taskList = _getDataSource();
            for (var data in taskList) {
              print(data.from);
            }
            print("refresh");
          });
        }, icon: const Icon(Icons.refresh)),
      ],
      headerWidget: headerWidget(context),
      headerExpandedHeight: 0.55,
      backgroundColor: wallpaper,
      appBarColor: Colors.white,
      bottomNavigationBar: NavBarWidget(
        currentIndex: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: brown,
        foregroundColor: CupertinoColors.white,
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: wallpaper,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "ออเดอร์",
              style: RmlTextStyle.sectionTitle,
            ),
            IconButton(onPressed: () {
              setState(() {
                taskList = _getDataSource();
                for (var data in taskList) {
                  print(data.from);
                }
                print("refresh");
              });
            }, icon: Icon(Icons.refresh))
          ]),
        ),
        listView(selectedDate),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 80, bottom: 20),
        color: Colors.white,
        child: SfCalendar(
          view: CalendarView.month,
          todayHighlightColor: brown,
          cellBorderColor: Colors.transparent,
          dataSource: TaskDataSource(taskList),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
          onSelectionChanged: (detail) {
            setState(() {
              selectedDate = detail.date!;
            });
          },
        ));
  }

  List<Task> _getDataSource() {
    final List<Task> meetings = <Task>[];
    for (var detail in jsonData) {
      final DateTime start = DateTime.parse(detail['startTime']);
      final DateTime end = DateTime.parse(detail['endTime']);

      print("add: ${start}");

      bool hasStart = meetings.any((task) =>
          _checkSameDate(task.from, start) &&
          task.color == green);

      bool hasEnd = meetings.any((task) =>
          _checkSameDate(task.to, end) &&
          task.color == red);

      if (!hasStart) {
        meetings.add(Task(start, start, green));
      }
      if (!hasEnd) {
        meetings.add(Task(end, end, red));
      }
    }
    return meetings;
  }

  Widget listView(DateTime selectedDate) {
    List<DateTime> dateList = jsonData
        .map((detail) =>
    [
      DateTime.parse(detail['startTime']),
      DateTime.parse(detail['endTime'])
    ]
    )
        .expand((dates) => dates)
        .toList();

    if (dateList.contains(selectedDate)) {
      List<Map<String, dynamic>> filteredData = _filterJsonData(selectedDate);
      return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Map<String, dynamic> orderData = filteredData[index];
            DateTime start = DateTime.parse(orderData['startTime']);
            // DateTime end = DateTime.parse(orderData['endTime']);
            return OrderCardWidget(
              product: "hello",
              productSize: "M",
              productColor: "น้ำเงิน",
              name: orderData['name'],
              phone: "091-234-5678",
              send: _checkSameDate(selectedDate, start)? true: false,
              msg: orderData['Delivery Method']=='Post Man'? false: true,
            );

          });
    } else {
      return Container(
          height: 150,
          child: Center(
            child: Text(
              "ไม่มีคิว",
              style: RmlTextStyle.normalText,
            ),
          ));
    }
  }
}

bool _checkSameDate(DateTime givenDate, DateTime selectedDate){
  if ( givenDate.year == selectedDate.year &&
      givenDate.month == selectedDate.month &&
      givenDate.day == selectedDate.day) {
    return true;
  } else { return false; }
}

class Task {
  Task(this.from, this.to, this.color);
  DateTime from;
  DateTime to;
  Color color;
}

class TaskDataSource extends CalendarDataSource {
  TaskDataSource(List<Task> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }
}

List<Map<String, dynamic>> _filterJsonData(DateTime selectedDate) {
  return jsonData.where((detail) {
    DateTime startTime = DateTime.parse(detail['startTime']);
    DateTime endTime = DateTime.parse(detail['endTime']);

    return _checkSameDate(startTime, selectedDate) ||
        _checkSameDate(endTime, selectedDate);
  }).toList();
}

List<Map<String, dynamic>> jsonData = [
  {
    'id': 1,
    'name': 'John Doe',
    'Delivery Method': 'Post Man',
    'startTime': '2023-12-17',
    'endTime': '2023-12-29',
  },
  {
    'id': 2,
    'name': 'John',
    'Delivery Method': 'Post Man',
    'startTime': '2023-12-27',
    'endTime': '2023-12-29',
  },
];
