class AppSettings {
  bool showLyricsInPlayer;
  bool autoScrollLyrics;
  String spotifyClientId;
  bool spotifyConnected;

  AppSettings({
    this.showLyricsInPlayer = true,
    this.autoScrollLyrics = true,
    this.spotifyClientId = '',
    this.spotifyConnected = false,
  });
}
