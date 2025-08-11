import 'package:flutter/material.dart';

class RemindersCard extends StatefulWidget {
  const RemindersCard({super.key});

  @override
  State<RemindersCard> createState() => _RemindersCardState();
}

class _RemindersCardState extends State<RemindersCard> {
  bool isEnabled = true;
  List<TimeOfDay?> reminderTimes = [const TimeOfDay(hour: 8, minute: 0)];

  void _addTime() {
    setState(() {
      reminderTimes.add(null);
    });
  }

  void _pickTime(int index) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: reminderTimes[index] ?? const TimeOfDay(hour: 8, minute: 0),
    );
    if (picked != null) {
      setState(() {
        reminderTimes[index] = picked;
      });
    }
  }

  void _removeTime(int index) {
    setState(() {
      reminderTimes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.30),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.access_time, color: Colors.orange, size: 22),
                  SizedBox(width: 8),
                  Text(
                    "Reminders",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Switch(
                value: isEnabled,
                onChanged: (value) {
                  setState(() => isEnabled = value);
                },
                activeTrackColor: Colors.blue,      // Açıkken arka plan
                inactiveTrackColor: Colors.grey.shade300, // Kapalıyken arka plan
                activeColor: Colors.white,          // Açıkken top rengi
                inactiveThumbColor: Colors.white,   // Kapalıyken top rengi
              )
            ],
          ),
          const SizedBox(height: 12),

          // Info Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7E6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: const [
                Icon(Icons.alarm, color: Colors.red, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Set your reminder times\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                        TextSpan(
                          text:
                          "We'll notify you when it's time to take your medicine",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            "Reminder Times",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 10),

          // Time Inputs
          Column(
            children: List.generate(reminderTimes.length, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.access_time,
                          color: Colors.white, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _pickTime(index),
                        child: Text(
                          reminderTimes[index] != null
                              ? reminderTimes[index]!.format(context)
                              : "--:--",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.schedule, size: 20),
                      onPressed: () => _pickTime(index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete,
                          size: 20, color: Colors.red),
                      onPressed: () => _removeTime(index),
                    ),
                  ],
                ),
              );
            }),
          ),

          // Add Another Time button
          GestureDetector(
            onTap: _addTime,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.shade400, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add, size: 20, color: Colors.black54),
                  SizedBox(width: 6),
                  Text(
                    "Add Another Time",
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
