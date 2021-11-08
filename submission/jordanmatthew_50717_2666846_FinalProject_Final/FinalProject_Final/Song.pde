//Songs are used to hold both a soundfile, and a tempo of that sound file for use by the gamemanager
//They also have a name for clarity
class Song {
  final String name;
  final SoundFile song;
  final int tempo;

  Song (String newName, SoundFile newSong, int newTempo) {
    //Name, song, and tempo initilized
    name = newName;
    song = newSong;
    tempo = newTempo;
  }
}
