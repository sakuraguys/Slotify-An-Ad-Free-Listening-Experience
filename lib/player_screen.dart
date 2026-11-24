import 'package:flutter/material.dart';
import 'app_settings.dart';
import 'liquid_glass_card.dart';
import 'lyrics_panel.dart';

class PlayerScreen extends StatefulWidget {
  final AppSettings settings;

  const PlayerScreen({super.key, required this.settings});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isPlaying = false;
  bool _isSaved = true;
  double _progress = 0.35;

  final List<String> _sampleLyrics = const [
    'Glass reflections in the midnight glow,',
    'Sound waves moving through the liquid air,',
    'Every saved memory starts to flow,',
    'No interruptions anywhere.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Now Playing'),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E3A5F),
              Color(0xFF0A0D14),
              Color(0xFF171026),
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              LiquidGlassCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF38BDF8), Color(0xFF818CF8)],
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.graphic_eq_rounded, size: 72),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Liquid Horizon',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'Slotify Demo Track',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => _isSaved = !_isSaved),
                          icon: Icon(
                            _isSaved
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: _isSaved
                                ? const Color(0xFF34D399)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _progress,
                      onChanged: (v) => setState(() => _progress = v),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          iconSize: 34,
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous_rounded),
                        ),
                        const SizedBox(width: 12),
                        LiquidGlassCard(
                          borderRadius: 999,
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () =>
                                setState(() => _isPlaying = !_isPlaying),
                            child: Icon(
                              _isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 34,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        IconButton(
                          iconSize: 34,
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (widget.settings.showLyricsInPlayer) ...[
                const SizedBox(height: 16),
                LyricsPanel(
                  trackTitle: 'Liquid Horizon',
                  artistName: 'Slotify Demo Track',
                  lines: _sampleLyrics,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
a
