import 'package:flutter/material.dart';
import 'app_settings.dart';
import 'liquid_glass_card.dart';

class SettingsScreen extends StatefulWidget {
  final AppSettings settings;
  final ValueChanged<AppSettings> onChanged;

  const SettingsScreen({
    super.key,
    required this.settings,
    required this.onChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _showLyrics;
  late bool _autoScroll;
  late TextEditingController _clientIdController;

  @override
  void initState() {
    super.initState();
    _showLyrics = widget.settings.showLyricsInPlayer;
    _autoScroll = widget.settings.autoScrollLyrics;
    _clientIdController =
        TextEditingController(text: widget.settings.spotifyClientId);
  }

  void _save() {
    widget.onChanged(
      AppSettings(
        showLyricsInPlayer: _showLyrics,
        autoScrollLyrics: _autoScroll,
        spotifyClientId: _clientIdController.text.trim(),
        spotifyConnected: widget.settings.spotifyConnected,
      ),
    );
  }

  @override
  void dispose() {
    _clientIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slotify Einstellungen')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          LiquidGlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lyrics-Tool',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Lyrics im Player anzeigen'),
                  subtitle: const Text('Blendet die Liquid-Glass-Lyrics ein oder aus'),
                  value: _showLyrics,
                  onChanged: (val) {
                    setState(() => _showLyrics = val);
                    _save();
                  },
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Automatisches Scrollen'),
                  value: _autoScroll,
                  onChanged: (val) {
                    setState(() => _autoScroll = val);
                    _save();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          LiquidGlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Spotify OAuth & Sync',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _clientIdController,
                  decoration: const InputDecoration(
                    labelText: 'Spotify Client ID',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) => _save(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
