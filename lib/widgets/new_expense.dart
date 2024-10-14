import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/expense.dart';

class NewExpence extends StatefulWidget {
  const NewExpence({super.key});

  @override
  State<NewExpence> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpence> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final DateFormat _dateFormat = DateFormat.yMd();
  Category _selectedCategory = Category.food;
  DateTime? _selectedDate;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title input.
            TextField(
              controller: _titleController,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                // Amount input.
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text('Amount'), prefixText: '\$'),
                  ),
                ),
                const SizedBox(width: 16),
                // Date picker
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No Date Selected'
                            : _dateFormat.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: () async {
                          final DateTime now = DateTime.now();
                          final DateTime firstDate =
                              DateTime(now.year - 1, now.month, now.day);
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: firstDate,
                            lastDate: now,
                          );
                          setState(() {
                            _selectedDate = pickedDate;
                          });
                        },
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (newCategory) {
                    if (newCategory == null) {
                      return;
                    } else {
                      setState(() {
                        _selectedCategory = newCategory;
                      });
                    }
                  },
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save Expense'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
