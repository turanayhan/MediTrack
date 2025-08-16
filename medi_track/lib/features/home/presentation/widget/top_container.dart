import 'package:flutter/material.dart';

Widget topContainer(BuildContext context) {
    return Container(
            height: MediaQuery.of(context).size.height / 4, // Ekranın 1/4'ü
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xFF6877E1)


            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Günaydın! 🌅",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Poppins', // << Override etti
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "24 Ocak 2025 Cuma",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'Poppins', // << Override etti
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:  Color(0xFF8C83D1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "İlaç Takip Performansın",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'Poppins', // << Override etti
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 14, // Kalınlık buradan ayarlanır
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.2), // Arka plan
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: 0.85,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                                  backgroundColor: Colors.white, // Artık Container'da verdik
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),
                          const Text(
                            "85%",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'Poppins', // << Override etti
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Unutma, düzenli ilaç önemli! 🕒",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Poppins', // << Override etti
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }