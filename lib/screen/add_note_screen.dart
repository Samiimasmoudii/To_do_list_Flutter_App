import 'package:flutter/material.dart';
import 'package:to_do_list/const/colors.dart';
import 'package:to_do_list/data/firestor.dart';
import 'package:to_do_list/widgets/date_picker.dart';

class Add_creen extends StatefulWidget {
  const Add_creen({super.key});

  @override
  State<Add_creen> createState() => _Add_creenState();
}

class _Add_creenState extends State<Add_creen> {
  final title = TextEditingController();
  final subtitle = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  int indexx = 0;

  DateTime? _selectedDate;
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ajouter une Tache !',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            title_widgets(),
            const SizedBox(height: 20,width:50),
            Text(
              'Que devez vous faire ?',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            description_widget(),
            const SizedBox(height: 20),

            Text(
              'Choisissez la date',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),
            DatePickerWidget(

              controller: _dateController,
              onTap: _selectDate,
            ),
            const SizedBox(height: 20),
            Text(
              'Type de tache',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold),
            ),

            imagess(),
            const SizedBox(height: 20),
            button()
          ],
        ),
      ),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: custom_green,
            minimumSize: const Size(170, 48),
          ),
          onPressed: () {
            Firestore_Datasource().AddNote(subtitle.text, title.text, _selectedDate.toString().split(" ")[0],indexx);
            Navigator.pop(context);
          },
          child: const Text('Ajouter'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: const Size(170, 48),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Annuler'),
        ),
      ],
    );
  }

  Widget imagess() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexx = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(left: index == 0 ? 7 : 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: indexx == index ? custom_green : Colors.grey,
                  ),
                ),
                width: 140,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.asset('images/$index.png'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget title_widgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: title,
          focusNode: _focusNode1,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: 'Nom de la Tache',
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
                  color: custom_green,
                  width: 2.0,
                ),
              )),
        ),
      ),
    );
  }


  Padding description_widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:100),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          maxLines: 3,
          controller: subtitle,
          focusNode: _focusNode2,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: 'Description',
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
                color: custom_green,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = picked.toString().split(" ")[0]; // Update text controller with selected date
      });
    }
  }


}