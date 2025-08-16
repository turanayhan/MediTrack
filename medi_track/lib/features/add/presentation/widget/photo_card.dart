import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class PhotoCard extends StatelessWidget {
  final VoidCallback onTapPhoto;

  const PhotoCard({
    Key? key,
    required this.onTapPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 16;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: [
      BoxShadow(
      color: Colors.grey.withOpacity(0.30),
      blurRadius: 10,
      offset: Offset(0, 5),
    ),]
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Başlık
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFB889FF), Color(0xFF6EA1FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.photo_camera_outlined,
                    color: Colors.white, size: 18),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'İlaç Fotoğrafı (İsteğe Bağlı)',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Foto alanı
          GestureDetector(
            onTap: onTapPhoto,
            child: DottedBorder(
              dashPattern: const [8, 6],
              strokeWidth: 2,
              color: const Color(0xFFEAD4FF),
              borderType: BorderType.RRect,
              radius: const Radius.circular(14),
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFF5F7),
                        Color(0xFFFFF0F3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 66,
                          height: 66,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFBC6BFF), Color(0xFFFF5CA8)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.camera_alt,
                              color: Colors.white, size: 30),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Fotoğraf eklemek için dokunun',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'İlacınızı tanımlamaya yardımcı olur',
                          style: TextStyle(
                            fontSize: 13.5,
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
