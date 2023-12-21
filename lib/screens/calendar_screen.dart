import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rentmylove/color_preset.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/nav_bar_widget.dart';
import 'package:draggable_home/draggable_home.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
          title: const Text(
            "ออเดอร์",
            style: RmlTextStyle.sectionTitle,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
          ],
          headerWidget: headerWidget(context),
          headerExpandedHeight: 0.55,
          backgroundColor: CupertinoColors.white,
          appBarColor: wallpaper,
          bottomNavigationBar: NavBarWidget(
            currentIndex: 0,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: brown,
            foregroundColor: CupertinoColors.white,
            onPressed: () {
              // Navigator.of(context).push(_createRoute());
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          body: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ออเดอร์",
                      style: RmlTextStyle.sectionTitle,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
                  ]),
            ),
            listView(),
          ],
        );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: wallpaper,
      child: Center(
        child: Text("Title"),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
        ),
      ),
    );
  }
}
