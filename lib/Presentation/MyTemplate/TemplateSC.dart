import 'package:doctor/Core/Controller.dart/templatecontroller.dart';
import 'package:doctor/Core/Controller.dart/templating.dart';
import 'package:doctor/Presentation/Reminder/widgets/custom_header_reminder.dart';
import 'package:doctor/widgets/Common/Appheader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Templatesc extends StatefulWidget {
  const Templatesc({super.key});

  @override
  State<Templatesc> createState() => _TemplatescState();
}

class _TemplatescState extends State<Templatesc> {
   final controller = Get.put(TemplateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // AppHeader(title: 'My Templates',
            // onBack: () {
            //   Get.back();
            // },
              
            // ),

             const CustomHeaderReminder(title: 'My Template'),

            /// TABS
            Obx(() {
              final selected = controller.selectedTab.value;
              return Row(
                children: [
                  _tab("Medicine", TemplateType.medicine, selected),
                  _tab("Lab Test", TemplateType.lab, selected),
                  _tab("Consent", TemplateType.consent, selected),
                ],
              );
            }),

            /// LIST
            Expanded(
              child: Obx(() {
                final list = controller.currentList;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) => _card(list[i]),
                );
              }),
            ),
          ],
        ),
      ),

      /// FLOATING +
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _openModal(context),
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  /// TAB
  Widget _tab(String title, TemplateType type, TemplateType selected) {
    final isActive = selected == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.switchTab(type),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? Colors.purple : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? Colors.purple : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// CARD
  Widget _card(String title) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.delete),
          SizedBox(width: 8),
          Icon(Icons.edit),
          SizedBox(width: 8),
          Icon(Icons.remove_red_eye),
        ],
      ),
    );
  }
}