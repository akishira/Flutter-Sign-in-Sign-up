import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:phtravel/components/custom_textfield.dart';

class Searchplace extends StatefulWidget {
  const Searchplace({super.key});

  @override
  State<Searchplace> createState() => _SearchplaceState();
}

class _SearchplaceState extends State<Searchplace> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: 1,
                          onChanged: (value) {
                            setState(() {});
                          },
                          focusNode: FocusNode(),
                          autofocus: true,
                          activeColor: const Color(0xFFE94057),
                          groupValue: null,
                        ),
                        const Icon(TablerIcons.dots_vertical),
                        Radio(
                          value: 1,
                          onChanged: (value) {
                            setState(() {});
                          },
                          focusNode: FocusNode(),
                          autofocus: true,
                          activeColor: const Color(0xFFE94057),
                          groupValue: null,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: const [
                        CustomTextfield(
                          hintText: 'Your location',
                        ),
                        SizedBox(height: 16), // Added spacing between fields
                        CustomTextfield(
                          hintText: 'Choose destination',
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(TablerIcons.switch_vertical),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            const TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(icon: Icon(TablerIcons.bus)),
                Tab(icon: Icon(TablerIcons.bus)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text('All content')),
                  Center(child: Text('Bus content 1')),
                  Center(child: Text('Bus content 2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
