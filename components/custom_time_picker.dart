import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'global.dart';

class CustomTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const CustomTimePicker({
    super.key,
    required this.controller,
    this.labelText = '',
    this.hintText = '',
  });

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? newSelectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
              dialBackgroundColor: AppColors.mainColor,
              dialHandColor: AppColors.secondaryColor,
              hourMinuteTextColor: AppColors.textColor,
              hourMinuteColor: AppColors.secondaryColor.withOpacity(0.2),
              dayPeriodTextColor: AppColors.textColor,
            ),
            colorScheme: const ColorScheme.dark(
              primary: AppColors.secondaryColor,
              onPrimary: Colors.white,
              surface: AppColors.mainColor,
              onSurface: AppColors.textColor,
            ),
            dialogBackgroundColor: Colors.blue[500],
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (newSelectedTime != null && newSelectedTime != _selectedTime) {
      setState(() {
        _selectedTime = newSelectedTime;
        final formattedTime = _formatTime(_selectedTime);
        widget.controller.text = formattedTime;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final DateTime now = DateTime.now();
    final DateTime formattedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    return DateFormat.jm().format(formattedDateTime); // 12-hour format
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: AlwaysDisabledFocusNode(),
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
      ),
      onTap: () => _selectTime(context),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
