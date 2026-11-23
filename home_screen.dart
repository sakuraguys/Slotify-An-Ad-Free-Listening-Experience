import 'package:flutter/material.dart';
import '../models/app_settings.dart';
import '../widgets/liquid_glass_card.dart';
import 'player_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final AppSettings settings;
  final ValueChanged<AppSettings> onSettingsChanged;

  const HomeScreen({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF132238),
              Color(0xFF07090F),
              Color(0xFF1D1333),
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Row(
                children: [
                  const Text(
                    'Slotify',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Spacer(),
                  LiquidGlassCard(
                    padding: const EdgeInsets.all(10),
                    borderRadius: 16,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SettingsScreen(
                              settings: settings,
                              onChanged: onSettingsChanged,
                            ),
                          ),
                        );
                      },
                      child: const Icon(Icons.settings_rounded, size: 22),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              LiquidGlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          settings.spotifyConnected
                              ? Icons.check_circle_rounded
                              : Icons.link_rounded,
                          color: settings.spotifyConnected
                              ? const Color(0xFF34D399)
                              : const Color(0xFF6EE7F9),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          settings.spotifyConnected
                              ? 'Spotify verbunden (Sync aktiv)'
                              : 'Spotify-Sync noch nicht verbunden',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Eigener Player ohne App-Werbung. Gespeicherte Songs & Playlists lassen sich über OAuth abgleichen.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.75),
                      ),
                    ),
                    const SizedBox(height: 14),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PlayerScreen(settings: settings),
                          ),
                        );
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Player öffnen'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
