import 'package:flutter/material.dart';

class PillHistorySearch extends StatefulWidget {
  const PillHistorySearch({super.key});

  @override
  State<PillHistorySearch> createState() => _PillHistorySearchState();
}

class _PillHistorySearchState extends State<PillHistorySearch> {
  int selectedIndex = 0;
  final List<String> tabs = ["Tümü (6)", "Aktif (4)", "Tamamlanan (1)"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Arama Kutusu ve Filtre Butonu
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "İlaçları ara...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(Icons.filter_list, color: Colors.grey[700]),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Sekme Butonları (Yatay kaydırılabilir)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final bool isSelected = index == selectedIndex;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                        colors: [Color(0xFF6A5AE0), Color(0xFF9C27B0)],
                      )
                          : null,
                      color: isSelected ? null : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}