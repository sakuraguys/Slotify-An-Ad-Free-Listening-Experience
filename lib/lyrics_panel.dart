import 'package:flutter/material.dart';
import 'liquid_glass_card.dart';

class LyricsPanel extends StatelessWidget {
  final String trackTitle;
  final String artistName;
  final List<String> lines;
  final int activeLineIndex;

  const LyricsPanel({
    super.key,
    required this.trackTitle,
    required this.artistName,
    required this.lines,
    this.activeLineIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidGlassCard(
      borderRadius: 26,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lyrics_rounded, size: 18, color: Color(0xFF6EE7F9)),
              const SizedBox(width: 8),
              const Text(
                'Lyrics',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const Spacer(),
              Text(
                '$trackTitle · $artistName',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(lines.length, (index) {
            final isActive = index == activeLineIndex;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                lines[index],
                style: TextStyle(
                  fontSize: isActive ? 17 : 14,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                  color: isActive
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.52),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
