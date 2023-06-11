import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../widgets/bulid_custom_card_category.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _startTime;
  late TextEditingController _endTime;
  DateTime selectedDate = DateTime.now();
  String category = "Meeting";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _dateController = TextEditingController(
        text: '${DateFormat('EEE, MMM d, ' 'yy').format(selectedDate)}');
    _startTime = TextEditingController(
        text: '${DateFormat.jm().format(DateTime.now())}');
    _endTime = TextEditingController(
        text: '${DateFormat.jm().format(DateTime.now().add(Duration(hours: 1)))}');
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2005),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        _dateController.text =
        '${DateFormat('EEE, MMM d, ' 'yy').format(selected)}';
      });
    }
  }

  _selectTime(BuildContext context, String timeType) async {
    final TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (result != null) {
      setState(() {
        if (timeType == "StartTime") {
          _startTime.text = result.format(context);
        } else {
          _endTime.text = result.format(context);
        }
      });
    }
  }

  _setCategory(String category) {
    setState(() {
      this.category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Color.fromRGBO(130, 0, 255, 1),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildAppBar(),
                _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
          ),
          SizedBox(width: 50),
          Text(
            "Create New Task",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      readOnly: true,
                      controller: _startTime,
                      decoration: _buildTextFieldDecoration("Start Time"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextField(
                      readOnly: true,
                      controller: _endTime,
                      decoration: _buildTextFieldDecoration("End Time"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 8,
                cursorColor: Colors.black26,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: _buildTextFieldDecoration("Description"),
              ),
            ),
            _buildCategorySection(),
            SizedBox(height: 100),
            _buildCreateTaskButton(),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildTextFieldDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      suffixIcon: Icon(
        Icons.alarm,
        color: Colors.black26,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      fillColor: Colors.black26,
      labelStyle: GoogleFonts.montserrat(
        color: Colors.black26,
        fontSize: 15,
      ),
    );
  }

  Widget _buildCategorySection() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Category",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              _buildCategoryCard('Marketting'),
              _buildCategoryCard('Meeting'),
              _buildCategoryCard('Study'),
              _buildCategoryCard('Sports'),
              _buildCategoryCard('Development'),
              _buildCategoryCard('Family'),
              _buildCategoryCard('Urgent'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String categoryText) {
    return GestureDetector(
      onTap: () {
        _setCategory(categoryText);
      },
      child: Categorcard(
        CategoryText: categoryText,
        isActive: category == categoryText,
      ),
    );
  }

  Widget _buildCreateTaskButton() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(130, 0, 255, 1),
      ),
      alignment: Alignment.center,
      child: Text(
        "Create Task",
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
