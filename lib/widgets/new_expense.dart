import 'package:flutter/material.dart';

import '../model/expense.dart';

class NewExpence extends StatelessWidget {
  const NewExpence({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title input.
            const TextField(
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),
            Row(
              children: [
                // Amount input.
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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
                      const Text('No Date Selected'),
                      IconButton(
                        onPressed: () {},
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
                  onChanged: (onChanged) {},
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
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
