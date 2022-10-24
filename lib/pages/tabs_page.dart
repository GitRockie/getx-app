import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/controller/bottom_navigation_controller.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _Pages(),
      bottomNavigationBar: Obx(() => const _Navigation()),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    return Obx((() => BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            onTap: (currentIndex) {
              bottomNavigationController.changeIndex(currentIndex);
            },
            currentIndex: bottomNavigationController.selectedIndex.value,
            items: const [
              BottomNavigationBarItem(
                label: 'For you',
                icon: Icon(Icons.person_outline),
              ),
              BottomNavigationBarItem(
                label: 'Headings',
                icon: Icon(Icons.public),
              ),
            ])));
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.teal,
        )
      ],
    );
  }
}
