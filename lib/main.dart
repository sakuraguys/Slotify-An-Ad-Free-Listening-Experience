import 'package:flutter/material.dart';
import 'app_settings.dart';
import 'home_screen.dart';

void main() {
  runApp(const SlotifyApp());
}

class SlotifyApp extends StatefulWidget {
  const SlotifyApp({super.key});

  @override
  State<SlotifyApp> createState() => _SlotifyAppState();
}

class _SlotifyAppState extends State<SlotifyApp> {
  final AppSettings _settings = AppSettings();

  void _updateSettings(AppSettings updated) {
    setState(() {
      _settings.showLyricsInPlayer = updated.showLyricsInPlayer;
      _settings.autoScrollLyrics = updated.autoScrollLyrics;
      _settings.spotifyClientId = updated.spotifyClientId;
      _settings.spotifyConnected = updated.spotifyConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slotify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF07090F),
        useMaterial3: true,
      ),
      home: HomeScreen(
        settings: _settings,
        onSettingsChanged: _updateSettings,
      ),
    );
  }
}
