import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'legend_dot.dart';

class WeekCard extends StatelessWidget {
  final double progress; // 0.0 - 1.0
  final int taken;
  final int missed;
  final int upcoming;
  final int adherence;

  const WeekCard({
    Key? key,
    this.progress = 0.92,
    this.taken = 28,
    this.missed = 2,
    this.upcoming = 5,
    this.adherence = 92,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double cardRadius = 16.0;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 460),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: icon + "This Week" + adherence
          Row(
            children: [
              Container(
                height: 34,
                width: 34,
                decoration: BoxDecoration(
                  color: Color(0xFFEEF6FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.show_chart, color: Color(0xFF2B7BE4), size: 18),
              ),
              SizedBox(width: 12),
              Text(
                'Bu Hafta',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              Spacer(),
              Text(
                '$adherence% uyum',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // Progress bar + day labels (use LayoutBuilder so we can position/measure accurately)
          LayoutBuilder(builder: (context, constraints) {
            final barHeight = 12.0;
            final fullWidth = constraints.maxWidth;
            final filledWidth = (progress.clamp(0.0, 1.0)) * fullWidth;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // progress bar stack: background track + filled gradient + subtle cap
                Stack(
                  children: [
                    // background track
                    Container(
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F6FB),
                        borderRadius: BorderRadius.circular(barHeight),
                      ),
                    ),

                    // filled part (gradient)
                    Container(
                      width: filledWidth,
                      height: barHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF4A90E2), Color(0xFF2B7BE4)]),
                        borderRadius: BorderRadius.circular(barHeight),
                      ),
                    ),

                    // subtle trailing lighter cap to mimic the design (a little lighter rectangle)
                    if (filledWidth < fullWidth)
                      Positioned(
                        left: filledWidth - 6, // overlap a little
                        child: Container(
                          width: 24,
                          height: barHeight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.25),
                                Colors.white.withOpacity(0.0)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                SizedBox(height: 12),

                // Weekday labels distributed evenly (Mon...Sun)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dayLabel('Pzt'),
                    _dayLabel('Sal'),
                    _dayLabel('Çar'),
                    _dayLabel('Per'),
                    _dayLabel('Cum'),
                    _dayLabel('Cmt'),
                    _dayLabel('Paz'),
                  ],
                ),
              ],
            );
          }),

          SizedBox(height: 16),

          // Legend row: dot + bold number + muted text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LegendDot(color: Color(0xFF2ECC71), number: taken, label: 'alınan'),
              LegendDot(color: Color(0xFFE74C3C), number: missed, label: 'kaçan'),
              LegendDot(color: Color(0xFF4A7BD8), number: upcoming, label: 'yakında'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dayLabel(String txt) => Text(
    txt,
    style: TextStyle(
      fontSize: 13,
      color: Colors.grey[600],
      fontFamily: 'Poppins',
    ),
  );
}

