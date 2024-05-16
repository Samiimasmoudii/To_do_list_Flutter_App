import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function() onTap;

  const DatePickerWidget({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'Date',
            hintText: 'Select Date',
            prefixIcon: const Icon(Icons.calendar_today),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
